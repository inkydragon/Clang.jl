using Clang

const LIBCLANG_INCLUDE = joinpath(@__DIR__, "..", "deps", "usr", "include", "clang-c") |> normpath
const LIBCLANG_HEADERS = [joinpath(LIBCLANG_INCLUDE, header) for header in readdir(LIBCLANG_INCLUDE) if endswith(header, ".h")]

function deformat_clang_docstring(docs::String)
    # 1. remove comment header
    replace_pair = [
        "/**" => "",
        "\n */" => "",
        " * " => "",
        " *"  => "",
    ]
    for rp in replace_pair
        docs = replace(docs, rp)
    end

    # 2. multiline replace & Add section
    muti_replace_pair = [
        # 1st \param
        #   case 1
        r"(\n)(\n)(\\\\param )([a-zA-Z_\(\)]+)( )" => s"\1\2# Arguments\1- `\4`: ",
        #   case 2
        r"^(\n)(\\\\param )([a-zA-Z_\(\)]+)( )" => s"\1# Arguments\1- `\3`: ",
        # \returns
        r"(\n){1,2}(\\\\returns )" => "\n\n# Return\n- ",
    ]
    for mrp in muti_replace_pair
        docs = replace(docs, mrp, count=1) # replace only once
    end

    # 3. keyword replace
    kw_replace_pair = [
        ## Doxygen commands
        # \brief
        r"\\\\brief " => "",
        # \c: <tt>
        r"(\\\\c )([^\s]+)( |\.|,|\(|\)){1}" => s"`\2` ",
        # \param
        r"(\\\\param )([a-zA-Z_]+)( )" => s"- `\2`: ",
    ]
    for kwrp in kw_replace_pair
        docs = replace(docs, kwrp)
    end

    docs
end

rewrite_docstring(v::Vector) = map(rewrite_docstring, v)
rewrite_docstring(s::String) = deformat_clang_docstring(s)
rewrite_docstring(x) = x

# create a work context
ctx = DefaultContext()

# parse headers
parse_headers!(ctx, LIBCLANG_HEADERS,
               args=["-I", joinpath(LIBCLANG_INCLUDE, ".."), map(x->"-I"*x, find_std_headers())...],
               includes=vcat(LIBCLANG_INCLUDE, CLANG_INCLUDE),
               )

# settings
ctx.libname = "libclang"
ctx.options["is_function_strictly_typed"] = false
ctx.options["is_struct_mutable"] = false

# write output
api_file = joinpath(@__DIR__, "libclang_api.jl")
api_stream = open(api_file, "w")

for trans_unit in ctx.trans_units
    root_cursor = getcursor(trans_unit)
    push!(ctx.cursor_stack, root_cursor)
    header = spelling(root_cursor)
    @info "wrapping header: $header ..."
    # loop over all of the child cursors and wrap them, if appropriate.
    ctx.children = children(root_cursor)
    for (i, child) in enumerate(ctx.children)
        child_name = name(child)
        child_header = filename(child)
        ctx.children_index = i
        # choose which cursor to wrap
        startswith(child_name, "__") && continue  # skip compiler definitions
        child_name in keys(ctx.common_buffer) && continue  # already wrapped
        child_header != header && continue  # skip if cursor filename is not in the headers to be wrapped

        wrap!(ctx, child)
    end
    @info "writing $(api_file)"
    println(api_stream, "# Julia wrapper for header: $(basename(header))")
    println(api_stream, "# Automatically generated using Clang.jl\n")
    ctx.api_buffer = rewrite_docstring(ctx.api_buffer)
    print_buffer(api_stream, ctx.api_buffer)
    empty!(ctx.api_buffer)  # clean up api_buffer for the next header
end
close(api_stream)

# write "common" definitions: types, typealiases, etc.
common_file = joinpath(@__DIR__, "libclang_common.jl")
open(common_file, "w") do f
    println(f, "# Automatically generated using Clang.jl\n")
    print_buffer(f, dump_to_buffer(ctx.common_buffer))
end

# uncomment the following code to generate dependency and template files
# copydeps(dirname(api_file))
# print_template(joinpath(dirname(api_file), "LibTemplate.jl"))
