# Julia wrapper for header: BuildSystem.h
# Automatically generated using Clang.jl


"""
    clang_getBuildSessionTimestamp()

Return the timestamp for use with Clang's
`-fbuild-session-timestamp=` option.
"""
function clang_getBuildSessionTimestamp()
    ccall((:clang_getBuildSessionTimestamp, libclang), Culonglong, ())
end

"""
    clang_VirtualFileOverlay_create(options)

Create a `CXVirtualFileOverlay` object.
Must be disposed with `clang_VirtualFileOverlay_dispose()` 

# Arguments
- `options`: is reserved, always pass 0.
"""
function clang_VirtualFileOverlay_create(options)
    ccall((:clang_VirtualFileOverlay_create, libclang), CXVirtualFileOverlay, (UInt32,), options)
end

"""
    clang_VirtualFileOverlay_addFileMapping(arg1, virtualPath, realPath)

Map an absolute virtual file path to an absolute real one.
The virtual path must be canonicalized (not contain \".\"/\"..\").

# Return
- 0 for success, non-zero to indicate an error.
"""
function clang_VirtualFileOverlay_addFileMapping(arg1, virtualPath, realPath)
    ccall((:clang_VirtualFileOverlay_addFileMapping, libclang), CXErrorCode, (CXVirtualFileOverlay, Cstring, Cstring), arg1, virtualPath, realPath)
end

"""
    clang_VirtualFileOverlay_setCaseSensitivity(arg1, caseSensitive)

Set the case sensitivity for the `CXVirtualFileOverlay` object.
The `CXVirtualFileOverlay` object is case-sensitive by default, this
option can be used to override the default.

# Return
- 0 for success, non-zero to indicate an error.
"""
function clang_VirtualFileOverlay_setCaseSensitivity(arg1, caseSensitive)
    ccall((:clang_VirtualFileOverlay_setCaseSensitivity, libclang), CXErrorCode, (CXVirtualFileOverlay, Cint), arg1, caseSensitive)
end

"""
    clang_VirtualFileOverlay_writeToBuffer(arg1, options, out_buffer_ptr, out_buffer_size)

Write out the `CXVirtualFileOverlay` object to a char buffer.

# Arguments
- `options`: is reserved, always pass 0.
- `out_buffer_ptr`: pointer to receive the buffer pointer, which should be
disposed using `clang_free()` 
- `out_buffer_size`: pointer to receive the buffer size.

# Return
- 0 for success, non-zero to indicate an error.
"""
function clang_VirtualFileOverlay_writeToBuffer(arg1, options, out_buffer_ptr, out_buffer_size)
    ccall((:clang_VirtualFileOverlay_writeToBuffer, libclang), CXErrorCode, (CXVirtualFileOverlay, UInt32, Ptr{Cstring}, Ptr{UInt32}), arg1, options, out_buffer_ptr, out_buffer_size)
end

"""
    clang_free(buffer)

free memory allocated by libclang, such as the buffer returned by
`CXVirtualFileOverlay()` or `clang_ModuleMapDescriptor_writeToBuffer()` 

# Arguments
- `buffer`: memory pointer to free.
"""
function clang_free(buffer)
    ccall((:clang_free, libclang), Cvoid, (Ptr{Cvoid},), buffer)
end

"""
    clang_VirtualFileOverlay_dispose(arg1)

Dispose a `CXVirtualFileOverlay` object.
"""
function clang_VirtualFileOverlay_dispose(arg1)
    ccall((:clang_VirtualFileOverlay_dispose, libclang), Cvoid, (CXVirtualFileOverlay,), arg1)
end

"""
    clang_ModuleMapDescriptor_create(options)

Create a `CXModuleMapDescriptor` object.
Must be disposed with `clang_ModuleMapDescriptor_dispose()` 

# Arguments
- `options`: is reserved, always pass 0.
"""
function clang_ModuleMapDescriptor_create(options)
    ccall((:clang_ModuleMapDescriptor_create, libclang), CXModuleMapDescriptor, (UInt32,), options)
end

"""
    clang_ModuleMapDescriptor_setFrameworkModuleName(arg1, name)

Sets the framework module name that the module.map describes.

# Return
- 0 for success, non-zero to indicate an error.
"""
function clang_ModuleMapDescriptor_setFrameworkModuleName(arg1, name)
    ccall((:clang_ModuleMapDescriptor_setFrameworkModuleName, libclang), CXErrorCode, (CXModuleMapDescriptor, Cstring), arg1, name)
end

"""
    clang_ModuleMapDescriptor_setUmbrellaHeader(arg1, name)

Sets the umbrealla header name that the module.map describes.

# Return
- 0 for success, non-zero to indicate an error.
"""
function clang_ModuleMapDescriptor_setUmbrellaHeader(arg1, name)
    ccall((:clang_ModuleMapDescriptor_setUmbrellaHeader, libclang), CXErrorCode, (CXModuleMapDescriptor, Cstring), arg1, name)
end

"""
    clang_ModuleMapDescriptor_writeToBuffer(arg1, options, out_buffer_ptr, out_buffer_size)

Write out the `CXModuleMapDescriptor` object to a char buffer.

# Arguments
- `options`: is reserved, always pass 0.
- `out_buffer_ptr`: pointer to receive the buffer pointer, which should be
disposed using `clang_free()` 
- `out_buffer_size`: pointer to receive the buffer size.

# Return
- 0 for success, non-zero to indicate an error.
"""
function clang_ModuleMapDescriptor_writeToBuffer(arg1, options, out_buffer_ptr, out_buffer_size)
    ccall((:clang_ModuleMapDescriptor_writeToBuffer, libclang), CXErrorCode, (CXModuleMapDescriptor, UInt32, Ptr{Cstring}, Ptr{UInt32}), arg1, options, out_buffer_ptr, out_buffer_size)
end

"""
    clang_ModuleMapDescriptor_dispose(arg1)

Dispose a `CXModuleMapDescriptor` object.
"""
function clang_ModuleMapDescriptor_dispose(arg1)
    ccall((:clang_ModuleMapDescriptor_dispose, libclang), Cvoid, (CXModuleMapDescriptor,), arg1)
end
# Julia wrapper for header: CXCompilationDatabase.h
# Automatically generated using Clang.jl


"""
    clang_CompilationDatabase_fromDirectory(BuildDir, ErrorCode)

Creates a compilation database from the database found in directory
buildDir. For example, CMake can output a compile_commands.json which can
be used to build the database.

It must be freed by `clang_CompilationDatabase_dispose` 
"""
function clang_CompilationDatabase_fromDirectory(BuildDir, ErrorCode)
    ccall((:clang_CompilationDatabase_fromDirectory, libclang), CXCompilationDatabase, (Cstring, Ptr{CXCompilationDatabase_Error}), BuildDir, ErrorCode)
end

"""
    clang_CompilationDatabase_dispose(arg1)

Free the given compilation database
"""
function clang_CompilationDatabase_dispose(arg1)
    ccall((:clang_CompilationDatabase_dispose, libclang), Cvoid, (CXCompilationDatabase,), arg1)
end

"""
    clang_CompilationDatabase_getCompileCommands(arg1, CompleteFileName)

Find the compile commands used for a file. The compile commands
must be freed by `clang_CompileCommands_dispose` 
"""
function clang_CompilationDatabase_getCompileCommands(arg1, CompleteFileName)
    ccall((:clang_CompilationDatabase_getCompileCommands, libclang), CXCompileCommands, (CXCompilationDatabase, Cstring), arg1, CompleteFileName)
end

"""
    clang_CompilationDatabase_getAllCompileCommands(arg1)

Get all the compile commands in the given compilation database.
"""
function clang_CompilationDatabase_getAllCompileCommands(arg1)
    ccall((:clang_CompilationDatabase_getAllCompileCommands, libclang), CXCompileCommands, (CXCompilationDatabase,), arg1)
end

"""
    clang_CompileCommands_dispose(arg1)

Free the given CompileCommands
"""
function clang_CompileCommands_dispose(arg1)
    ccall((:clang_CompileCommands_dispose, libclang), Cvoid, (CXCompileCommands,), arg1)
end

"""
    clang_CompileCommands_getSize(arg1)

Get the number of CompileCommand we have for a file
"""
function clang_CompileCommands_getSize(arg1)
    ccall((:clang_CompileCommands_getSize, libclang), UInt32, (CXCompileCommands,), arg1)
end

"""
    clang_CompileCommands_getCommand(arg1, I)

Get the I'th CompileCommand for a file

Note : 0 <= i < clang_CompileCommands_getSize(CXCompileCommands)
"""
function clang_CompileCommands_getCommand(arg1, I)
    ccall((:clang_CompileCommands_getCommand, libclang), CXCompileCommand, (CXCompileCommands, UInt32), arg1, I)
end

"""
    clang_CompileCommand_getDirectory(arg1)

Get the working directory where the CompileCommand was executed from
"""
function clang_CompileCommand_getDirectory(arg1)
    ccall((:clang_CompileCommand_getDirectory, libclang), CXString, (CXCompileCommand,), arg1)
end

"""
    clang_CompileCommand_getFilename(arg1)

Get the filename associated with the CompileCommand.
"""
function clang_CompileCommand_getFilename(arg1)
    ccall((:clang_CompileCommand_getFilename, libclang), CXString, (CXCompileCommand,), arg1)
end

"""
    clang_CompileCommand_getNumArgs(arg1)

Get the number of arguments in the compiler invocation.

"""
function clang_CompileCommand_getNumArgs(arg1)
    ccall((:clang_CompileCommand_getNumArgs, libclang), UInt32, (CXCompileCommand,), arg1)
end

"""
    clang_CompileCommand_getArg(arg1, I)

Get the I'th argument value in the compiler invocations

Invariant :
 - argument 0 is the compiler executable
"""
function clang_CompileCommand_getArg(arg1, I)
    ccall((:clang_CompileCommand_getArg, libclang), CXString, (CXCompileCommand, UInt32), arg1, I)
end

"""
    clang_CompileCommand_getNumMappedSources(arg1)

Get the number of source mappings for the compiler invocation.
"""
function clang_CompileCommand_getNumMappedSources(arg1)
    ccall((:clang_CompileCommand_getNumMappedSources, libclang), UInt32, (CXCompileCommand,), arg1)
end

"""
    clang_CompileCommand_getMappedSourcePath(arg1, I)

Get the I'th mapped source path for the compiler invocation.
"""
function clang_CompileCommand_getMappedSourcePath(arg1, I)
    ccall((:clang_CompileCommand_getMappedSourcePath, libclang), CXString, (CXCompileCommand, UInt32), arg1, I)
end

"""
    clang_CompileCommand_getMappedSourceContent(arg1, I)

Get the I'th mapped source content for the compiler invocation.
"""
function clang_CompileCommand_getMappedSourceContent(arg1, I)
    ccall((:clang_CompileCommand_getMappedSourceContent, libclang), CXString, (CXCompileCommand, UInt32), arg1, I)
end
# Julia wrapper for header: CXErrorCode.h
# Automatically generated using Clang.jl

# Julia wrapper for header: CXString.h
# Automatically generated using Clang.jl


"""
    clang_getCString(string)

Retrieve the character data associated with the given string.
"""
function clang_getCString(string)
    ccall((:clang_getCString, libclang), Cstring, (CXString,), string)
end

"""
    clang_disposeString(string)

Free the given string.
"""
function clang_disposeString(string)
    ccall((:clang_disposeString, libclang), Cvoid, (CXString,), string)
end

"""
    clang_disposeStringSet(set)

Free the given string set.
"""
function clang_disposeStringSet(set)
    ccall((:clang_disposeStringSet, libclang), Cvoid, (Ptr{CXStringSet},), set)
end
# Julia wrapper for header: Documentation.h
# Automatically generated using Clang.jl


"""
    clang_Cursor_getParsedComment(C)

Given a cursor that represents a documentable entity (e.g.,
declaration), return the associated parsed comment as a
`CXComment_FullComment` AST node.
"""
function clang_Cursor_getParsedComment(C)
    ccall((:clang_Cursor_getParsedComment, libclang), CXComment, (CXCursor,), C)
end

"""
    clang_Comment_getKind(Comment)

# Arguments
- `Comment`: AST node of any kind.

# Return
- the type of the AST node.
"""
function clang_Comment_getKind(Comment)
    ccall((:clang_Comment_getKind, libclang), CXCommentKind, (CXComment,), Comment)
end

"""
    clang_Comment_getNumChildren(Comment)

# Arguments
- `Comment`: AST node of any kind.

# Return
- number of children of the AST node.
"""
function clang_Comment_getNumChildren(Comment)
    ccall((:clang_Comment_getNumChildren, libclang), UInt32, (CXComment,), Comment)
end

"""
    clang_Comment_getChild(Comment, ChildIdx)

# Arguments
- `Comment`: AST node of any kind.

# Arguments
- `ChildIdx`: child index (zero-based).

# Return
- the specified child of the AST node.
"""
function clang_Comment_getChild(Comment, ChildIdx)
    ccall((:clang_Comment_getChild, libclang), CXComment, (CXComment, UInt32), Comment, ChildIdx)
end

"""
    clang_Comment_isWhitespace(Comment)

A `CXComment_Paragraph` node is considered whitespace if it contains
only `CXComment_Text` nodes that are empty or whitespace.

Other AST nodes (except `CXComment_Paragraph` and `CXComment_Text)` are
never considered whitespace.

# Return
- non-zero if `Comment` is whitespace.
"""
function clang_Comment_isWhitespace(Comment)
    ccall((:clang_Comment_isWhitespace, libclang), UInt32, (CXComment,), Comment)
end

"""
    clang_InlineContentComment_hasTrailingNewline(Comment)


# Return
- non-zero if `Comment` is inline content and has a newline
immediately following it in the comment text.  Newlines between paragraphs
do not count.
"""
function clang_InlineContentComment_hasTrailingNewline(Comment)
    ccall((:clang_InlineContentComment_hasTrailingNewline, libclang), UInt32, (CXComment,), Comment)
end

"""
    clang_TextComment_getText(Comment)

# Arguments
- `Comment`: a `CXComment_Text` AST node.

# Return
- text contained in the AST node.
"""
function clang_TextComment_getText(Comment)
    ccall((:clang_TextComment_getText, libclang), CXString, (CXComment,), Comment)
end

"""
    clang_InlineCommandComment_getCommandName(Comment)

# Arguments
- `Comment`: a `CXComment_InlineCommand` AST node.

# Return
- name of the inline command.
"""
function clang_InlineCommandComment_getCommandName(Comment)
    ccall((:clang_InlineCommandComment_getCommandName, libclang), CXString, (CXComment,), Comment)
end

"""
    clang_InlineCommandComment_getRenderKind(Comment)

# Arguments
- `Comment`: a `CXComment_InlineCommand` AST node.

# Return
- the most appropriate rendering mode, chosen on command
semantics in Doxygen.
"""
function clang_InlineCommandComment_getRenderKind(Comment)
    ccall((:clang_InlineCommandComment_getRenderKind, libclang), CXCommentInlineCommandRenderKind, (CXComment,), Comment)
end

"""
    clang_InlineCommandComment_getNumArgs(Comment)

# Arguments
- `Comment`: a `CXComment_InlineCommand` AST node.

# Return
- number of command arguments.
"""
function clang_InlineCommandComment_getNumArgs(Comment)
    ccall((:clang_InlineCommandComment_getNumArgs, libclang), UInt32, (CXComment,), Comment)
end

"""
    clang_InlineCommandComment_getArgText(Comment, ArgIdx)

# Arguments
- `Comment`: a `CXComment_InlineCommand` AST node.

# Arguments
- `ArgIdx`: argument index (zero-based).

# Return
- text of the specified argument.
"""
function clang_InlineCommandComment_getArgText(Comment, ArgIdx)
    ccall((:clang_InlineCommandComment_getArgText, libclang), CXString, (CXComment, UInt32), Comment, ArgIdx)
end

"""
    clang_HTMLTagComment_getTagName(Comment)

# Arguments
- `Comment`: a `CXComment_HTMLStartTag` or `CXComment_HTMLEndTag` AST
node.

# Return
- HTML tag name.
"""
function clang_HTMLTagComment_getTagName(Comment)
    ccall((:clang_HTMLTagComment_getTagName, libclang), CXString, (CXComment,), Comment)
end

"""
    clang_HTMLStartTagComment_isSelfClosing(Comment)

# Arguments
- `Comment`: a `CXComment_HTMLStartTag` AST node.

# Return
- non-zero if tag is self-closing (for example, &lt;br /&gt;).
"""
function clang_HTMLStartTagComment_isSelfClosing(Comment)
    ccall((:clang_HTMLStartTagComment_isSelfClosing, libclang), UInt32, (CXComment,), Comment)
end

"""
    clang_HTMLStartTag_getNumAttrs(Comment)

# Arguments
- `Comment`: a `CXComment_HTMLStartTag` AST node.

# Return
- number of attributes (name-value pairs) attached to the start tag.
"""
function clang_HTMLStartTag_getNumAttrs(Comment)
    ccall((:clang_HTMLStartTag_getNumAttrs, libclang), UInt32, (CXComment,), Comment)
end

"""
    clang_HTMLStartTag_getAttrName(Comment, AttrIdx)

# Arguments
- `Comment`: a `CXComment_HTMLStartTag` AST node.

# Arguments
- `AttrIdx`: attribute index (zero-based).

# Return
- name of the specified attribute.
"""
function clang_HTMLStartTag_getAttrName(Comment, AttrIdx)
    ccall((:clang_HTMLStartTag_getAttrName, libclang), CXString, (CXComment, UInt32), Comment, AttrIdx)
end

"""
    clang_HTMLStartTag_getAttrValue(Comment, AttrIdx)

# Arguments
- `Comment`: a `CXComment_HTMLStartTag` AST node.

# Arguments
- `AttrIdx`: attribute index (zero-based).

# Return
- value of the specified attribute.
"""
function clang_HTMLStartTag_getAttrValue(Comment, AttrIdx)
    ccall((:clang_HTMLStartTag_getAttrValue, libclang), CXString, (CXComment, UInt32), Comment, AttrIdx)
end

"""
    clang_BlockCommandComment_getCommandName(Comment)

# Arguments
- `Comment`: a `CXComment_BlockCommand` AST node.

# Return
- name of the block command.
"""
function clang_BlockCommandComment_getCommandName(Comment)
    ccall((:clang_BlockCommandComment_getCommandName, libclang), CXString, (CXComment,), Comment)
end

"""
    clang_BlockCommandComment_getNumArgs(Comment)

# Arguments
- `Comment`: a `CXComment_BlockCommand` AST node.

# Return
- number of word-like arguments.
"""
function clang_BlockCommandComment_getNumArgs(Comment)
    ccall((:clang_BlockCommandComment_getNumArgs, libclang), UInt32, (CXComment,), Comment)
end

"""
    clang_BlockCommandComment_getArgText(Comment, ArgIdx)

# Arguments
- `Comment`: a `CXComment_BlockCommand` AST node.

# Arguments
- `ArgIdx`: argument index (zero-based).

# Return
- text of the specified word-like argument.
"""
function clang_BlockCommandComment_getArgText(Comment, ArgIdx)
    ccall((:clang_BlockCommandComment_getArgText, libclang), CXString, (CXComment, UInt32), Comment, ArgIdx)
end

"""
    clang_BlockCommandComment_getParagraph(Comment)

# Arguments
- `Comment`: a `CXComment_BlockCommand` or
`CXComment_VerbatimBlockCommand` AST node.

# Return
- paragraph argument of the block command.
"""
function clang_BlockCommandComment_getParagraph(Comment)
    ccall((:clang_BlockCommandComment_getParagraph, libclang), CXComment, (CXComment,), Comment)
end

"""
    clang_ParamCommandComment_getParamName(Comment)

# Arguments
- `Comment`: a `CXComment_ParamCommand` AST node.

# Return
- parameter name.
"""
function clang_ParamCommandComment_getParamName(Comment)
    ccall((:clang_ParamCommandComment_getParamName, libclang), CXString, (CXComment,), Comment)
end

"""
    clang_ParamCommandComment_isParamIndexValid(Comment)

# Arguments
- `Comment`: a `CXComment_ParamCommand` AST node.

# Return
- non-zero if the parameter that this AST node represents was found
in the function prototype and \\c clang_ParamCommandComment_getParamIndex
function will return a meaningful value.
"""
function clang_ParamCommandComment_isParamIndexValid(Comment)
    ccall((:clang_ParamCommandComment_isParamIndexValid, libclang), UInt32, (CXComment,), Comment)
end

"""
    clang_ParamCommandComment_getParamIndex(Comment)

# Arguments
- `Comment`: a `CXComment_ParamCommand` AST node.

# Return
- zero-based parameter index in function prototype.
"""
function clang_ParamCommandComment_getParamIndex(Comment)
    ccall((:clang_ParamCommandComment_getParamIndex, libclang), UInt32, (CXComment,), Comment)
end

"""
    clang_ParamCommandComment_isDirectionExplicit(Comment)

# Arguments
- `Comment`: a `CXComment_ParamCommand` AST node.

# Return
- non-zero if parameter passing direction was specified explicitly in
the comment.
"""
function clang_ParamCommandComment_isDirectionExplicit(Comment)
    ccall((:clang_ParamCommandComment_isDirectionExplicit, libclang), UInt32, (CXComment,), Comment)
end

"""
    clang_ParamCommandComment_getDirection(Comment)

# Arguments
- `Comment`: a `CXComment_ParamCommand` AST node.

# Return
- parameter passing direction.
"""
function clang_ParamCommandComment_getDirection(Comment)
    ccall((:clang_ParamCommandComment_getDirection, libclang), CXCommentParamPassDirection, (CXComment,), Comment)
end

"""
    clang_TParamCommandComment_getParamName(Comment)

# Arguments
- `Comment`: a `CXComment_TParamCommand` AST node.

# Return
- template parameter name.
"""
function clang_TParamCommandComment_getParamName(Comment)
    ccall((:clang_TParamCommandComment_getParamName, libclang), CXString, (CXComment,), Comment)
end

"""
    clang_TParamCommandComment_isParamPositionValid(Comment)

# Arguments
- `Comment`: a `CXComment_TParamCommand` AST node.

# Return
- non-zero if the parameter that this AST node represents was found
in the template parameter list and
`clang_TParamCommandComment_getDepth` and
`clang_TParamCommandComment_getIndex` functions will return a meaningful
value.
"""
function clang_TParamCommandComment_isParamPositionValid(Comment)
    ccall((:clang_TParamCommandComment_isParamPositionValid, libclang), UInt32, (CXComment,), Comment)
end

"""
    clang_TParamCommandComment_getDepth(Comment)

# Arguments
- `Comment`: a `CXComment_TParamCommand` AST node.

# Return
- zero-based nesting depth of this parameter in the template parameter list.

For example,
\\verbatim
    template<typename C, template<typename T> class TT>
    void test(TT<int> aaa);
\\endverbatim
for C and TT nesting depth is 0,
for T nesting depth is 1.
"""
function clang_TParamCommandComment_getDepth(Comment)
    ccall((:clang_TParamCommandComment_getDepth, libclang), UInt32, (CXComment,), Comment)
end

"""
    clang_TParamCommandComment_getIndex(Comment, Depth)

# Arguments
- `Comment`: a `CXComment_TParamCommand` AST node.

# Return
- zero-based parameter index in the template parameter list at a
given nesting depth.

For example,
\\verbatim
    template<typename C, template<typename T> class TT>
    void test(TT<int> aaa);
\\endverbatim
for C and TT nesting depth is 0, so we can ask for index at depth 0:
at depth 0 C's index is 0, TT's index is 1.

For T nesting depth is 1, so we can ask for index at depth 0 and 1:
at depth 0 T's index is 1 (same as TT's),
at depth 1 T's index is 0.
"""
function clang_TParamCommandComment_getIndex(Comment, Depth)
    ccall((:clang_TParamCommandComment_getIndex, libclang), UInt32, (CXComment, UInt32), Comment, Depth)
end

"""
    clang_VerbatimBlockLineComment_getText(Comment)

# Arguments
- `Comment`: a `CXComment_VerbatimBlockLine` AST node.

# Return
- text contained in the AST node.
"""
function clang_VerbatimBlockLineComment_getText(Comment)
    ccall((:clang_VerbatimBlockLineComment_getText, libclang), CXString, (CXComment,), Comment)
end

"""
    clang_VerbatimLineComment_getText(Comment)

# Arguments
- `Comment`: a `CXComment_VerbatimLine` AST node.

# Return
- text contained in the AST node.
"""
function clang_VerbatimLineComment_getText(Comment)
    ccall((:clang_VerbatimLineComment_getText, libclang), CXString, (CXComment,), Comment)
end

"""
    clang_HTMLTagComment_getAsString(Comment)

Convert an HTML tag AST node to string.

# Arguments
- `Comment`: a `CXComment_HTMLStartTag` or `CXComment_HTMLEndTag` AST
node.

# Return
- string containing an HTML tag.
"""
function clang_HTMLTagComment_getAsString(Comment)
    ccall((:clang_HTMLTagComment_getAsString, libclang), CXString, (CXComment,), Comment)
end

"""
    clang_FullComment_getAsHTML(Comment)

Convert a given full parsed comment to an HTML fragment.

Specific details of HTML layout are subject to change.  Don't try to parse
this HTML back into an AST, use other APIs instead.

Currently the following CSS classes are used:
\\li \"para-brief\" for \\paragraph and equivalent commands;
\\li \"para-returns\" for \\\\returns paragraph and equivalent commands;
\\li \"word-returns\" for the \"Returns\" word in \\\\returns paragraph.

Function argument documentation is rendered as a \\<dl\\> list with arguments
sorted in function prototype order.  CSS classes used:
\\li \"param-name-index-NUMBER\" for parameter name (\\<dt\\>);
\\li \"param-descr-index-NUMBER\" for parameter description (\\<dd\\>);
\\li \"param-name-index-invalid\" and \"param-descr-index-invalid\" are used if
parameter index is invalid.

Template parameter documentation is rendered as a \\<dl\\> list with
parameters sorted in template parameter list order.  CSS classes used:
\\li \"tparam-name-index-NUMBER\" for parameter name (\\<dt\\>);
\\li \"tparam-descr-index-NUMBER\" for parameter description (\\<dd\\>);
\\li \"tparam-name-index-other\" and \"tparam-descr-index-other\" are used for
names inside template template parameters;
\\li \"tparam-name-index-invalid\" and \"tparam-descr-index-invalid\" are used if
parameter position is invalid.

# Arguments
- `Comment`: a `CXComment_FullComment` AST node.

# Return
- string containing an HTML fragment.
"""
function clang_FullComment_getAsHTML(Comment)
    ccall((:clang_FullComment_getAsHTML, libclang), CXString, (CXComment,), Comment)
end

"""
    clang_FullComment_getAsXML(Comment)

Convert a given full parsed comment to an XML document.

A Relax NG schema for the XML can be found in comment-xml-schema.rng file
inside clang source tree.

# Arguments
- `Comment`: a `CXComment_FullComment` AST node.

# Return
- string containing an XML document.
"""
function clang_FullComment_getAsXML(Comment)
    ccall((:clang_FullComment_getAsXML, libclang), CXString, (CXComment,), Comment)
end
# Julia wrapper for header: Index.h
# Automatically generated using Clang.jl


"""
    clang_createIndex(excludeDeclarationsFromPCH, displayDiagnostics)

Provides a shared context for creating translation units.

It provides two options:

- excludeDeclarationsFromPCH: When non-zero, allows enumeration of \"local\"
declarations (when loading any new translation units). A \"local\" declaration
is one that belongs in the translation unit itself and not in a precompiled
header that was used by the translation unit. If zero, all declarations
will be enumerated.

Here is an example:

\\code
  // excludeDeclsFromPCH = 1, displayDiagnostics=1
  Idx = clang_createIndex(1, 1);

  // IndexTest.pch was produced with the following command:
  // \"clang -x c IndexTest.h -emit-ast -o IndexTest.pch\"
  TU = clang_createTranslationUnit(Idx, \"IndexTest.pch\");

  // This will load all the symbols from 'IndexTest.pch'
  clang_visitChildren(clang_getTranslationUnitCursor(TU),
                      TranslationUnitVisitor, 0);
  clang_disposeTranslationUnit(TU);

  // This will load all the symbols from 'IndexTest.c', excluding symbols
  // from 'IndexTest.pch'.
  charargs[] = { \"-Xclang\", \"-include-pch=IndexTest.pch\" };
  TU = clang_createTranslationUnitFromSourceFile(Idx, \"IndexTest.c\", 2, args,
                                                 0, 0);
  clang_visitChildren(clang_getTranslationUnitCursor(TU),
                      TranslationUnitVisitor, 0);
  clang_disposeTranslationUnit(TU);
\\endcode

This process of creating the 'pch', loading it separately, and using it (via
-include-pch) allows 'excludeDeclsFromPCH' to remove redundant callbacks
(which gives the indexer the same performance benefit as the compiler).
"""
function clang_createIndex(excludeDeclarationsFromPCH, displayDiagnostics)
    ccall((:clang_createIndex, libclang), CXIndex, (Cint, Cint), excludeDeclarationsFromPCH, displayDiagnostics)
end

"""
    clang_disposeIndex(index)

Destroy the given index.

The index must not be destroyed until all of the translation units created
within that index have been destroyed.
"""
function clang_disposeIndex(index)
    ccall((:clang_disposeIndex, libclang), Cvoid, (CXIndex,), index)
end

"""
    clang_CXIndex_setGlobalOptions(arg1, options)

Sets general options associated with a CXIndex.

For example:
\\code
CXIndex idx = ...;
clang_CXIndex_setGlobalOptions(idx,
    clang_CXIndex_getGlobalOptions(idx) |
    CXGlobalOpt_ThreadBackgroundPriorityForIndexing);
\\endcode

# Arguments
- `options`: A bitmask of options, a bitwise OR of CXGlobalOpt_XXX flags.
"""
function clang_CXIndex_setGlobalOptions(arg1, options)
    ccall((:clang_CXIndex_setGlobalOptions, libclang), Cvoid, (CXIndex, UInt32), arg1, options)
end

"""
    clang_CXIndex_getGlobalOptions(arg1)

Gets the general options associated with a CXIndex.

# Return
- A bitmask of options, a bitwise OR of CXGlobalOpt_XXX flags that
are associated with the given CXIndex object.
"""
function clang_CXIndex_getGlobalOptions(arg1)
    ccall((:clang_CXIndex_getGlobalOptions, libclang), UInt32, (CXIndex,), arg1)
end

"""
    clang_CXIndex_setInvocationEmissionPathOption(arg1, Path)

Sets the invocation emission path option in a CXIndex.

The invocation emission path specifies a path which will contain log
files for certain libclang invocations. A null value (default) implies that
libclang invocations are not logged..
"""
function clang_CXIndex_setInvocationEmissionPathOption(arg1, Path)
    ccall((:clang_CXIndex_setInvocationEmissionPathOption, libclang), Cvoid, (CXIndex, Cstring), arg1, Path)
end

"""
    clang_getFileName(SFile)

Retrieve the complete file and path name of the given file.
"""
function clang_getFileName(SFile)
    ccall((:clang_getFileName, libclang), CXString, (CXFile,), SFile)
end

"""
    clang_getFileTime(SFile)

Retrieve the last modification time of the given file.
"""
function clang_getFileTime(SFile)
    ccall((:clang_getFileTime, libclang), Ctime_t, (CXFile,), SFile)
end

"""
    clang_getFileUniqueID(file, outID)

Retrieve the unique ID for the given `file` 

# Arguments
- `file`: the file to get the ID for.
- `outID`: stores the returned CXFileUniqueID.

# Return
- If there was a failure getting the unique ID, returns non-zero,
otherwise returns 0.
*/
"""
function clang_getFileUniqueID(file, outID)
    ccall((:clang_getFileUniqueID, libclang), Cint, (CXFile, Ptr{CXFileUniqueID}), file, outID)
end

"""
    clang_isFileMultipleIncludeGuarded(tu, file)

Determine whether the given header is guarded against
multiple inclusions, either with the conventional
\\#ifndef/\\#define/\\#endif macro guards or with \\#pragma once.
"""
function clang_isFileMultipleIncludeGuarded(tu, file)
    ccall((:clang_isFileMultipleIncludeGuarded, libclang), UInt32, (CXTranslationUnit, CXFile), tu, file)
end

"""
    clang_getFile(tu, file_name)

Retrieve a file handle within the given translation unit.

# Arguments
- `tu`: the translation unit

- `file_name`: the name of the file.

# Return
- the file handle for the named file in the translation unit \\p tu,
or a NULL file handle if the file was not a part of this translation unit.
"""
function clang_getFile(tu, file_name)
    ccall((:clang_getFile, libclang), CXFile, (CXTranslationUnit, Cstring), tu, file_name)
end

"""
    clang_getFileContents(tu, file, size)

Retrieve the buffer associated with the given file.

# Arguments
- `tu`: the translation unit

- `file`: the file for which to retrieve the buffer.

- `size`: [out] if non-NULL, will be set to the size of the buffer.

# Return
- a pointer to the buffer in memory that holds the contents of
\\p file, or a NULL pointer when the file is not loaded.
"""
function clang_getFileContents(tu, file, size)
    ccall((:clang_getFileContents, libclang), Cstring, (CXTranslationUnit, CXFile, Ptr{Csize_t}), tu, file, size)
end

"""
    clang_File_isEqual(file1, file2)

Returns non-zero if the `file1` and `file2` point to the same file,
or they are both NULL.
"""
function clang_File_isEqual(file1, file2)
    ccall((:clang_File_isEqual, libclang), Cint, (CXFile, CXFile), file1, file2)
end

"""
    clang_getNullLocation()

Retrieve a NULL (invalid) source location.
"""
function clang_getNullLocation()
    ccall((:clang_getNullLocation, libclang), CXSourceLocation, ())
end

"""
    clang_equalLocations(loc1, loc2)

Determine whether two source locations, which must refer into
the same translation unit, refer to exactly the same point in the source
code.

# Return
- non-zero if the source locations refer to the same location, zero
if they refer to different locations.
"""
function clang_equalLocations(loc1, loc2)
    ccall((:clang_equalLocations, libclang), UInt32, (CXSourceLocation, CXSourceLocation), loc1, loc2)
end

"""
    clang_getLocation(tu, file, line, column)

Retrieves the source location associated with a given file/line/column
in a particular translation unit.
"""
function clang_getLocation(tu, file, line, column)
    ccall((:clang_getLocation, libclang), CXSourceLocation, (CXTranslationUnit, CXFile, UInt32, UInt32), tu, file, line, column)
end

"""
    clang_getLocationForOffset(tu, file, offset)

Retrieves the source location associated with a given character offset
in a particular translation unit.
"""
function clang_getLocationForOffset(tu, file, offset)
    ccall((:clang_getLocationForOffset, libclang), CXSourceLocation, (CXTranslationUnit, CXFile, UInt32), tu, file, offset)
end

"""
    clang_Location_isInSystemHeader(location)

Returns non-zero if the given source location is in a system header.
"""
function clang_Location_isInSystemHeader(location)
    ccall((:clang_Location_isInSystemHeader, libclang), Cint, (CXSourceLocation,), location)
end

"""
    clang_Location_isFromMainFile(location)

Returns non-zero if the given source location is in the main file of
the corresponding translation unit.
"""
function clang_Location_isFromMainFile(location)
    ccall((:clang_Location_isFromMainFile, libclang), Cint, (CXSourceLocation,), location)
end

"""
    clang_getNullRange()

Retrieve a NULL (invalid) source range.
"""
function clang_getNullRange()
    ccall((:clang_getNullRange, libclang), CXSourceRange, ())
end

"""
    clang_getRange(_begin, _end)

Retrieve a source range given the beginning and ending source
locations.
"""
function clang_getRange(_begin, _end)
    ccall((:clang_getRange, libclang), CXSourceRange, (CXSourceLocation, CXSourceLocation), _begin, _end)
end

"""
    clang_equalRanges(range1, range2)

Determine whether two ranges are equivalent.

# Return
- non-zero if the ranges are the same, zero if they differ.
"""
function clang_equalRanges(range1, range2)
    ccall((:clang_equalRanges, libclang), UInt32, (CXSourceRange, CXSourceRange), range1, range2)
end

"""
    clang_Range_isNull(range)

Returns non-zero if \\p range is null.
"""
function clang_Range_isNull(range)
    ccall((:clang_Range_isNull, libclang), Cint, (CXSourceRange,), range)
end

"""
    clang_getExpansionLocation(location, file, line, column, offset)

Retrieve the file, line, column, and offset represented by
the given source location.

If the location refers into a macro expansion, retrieves the
location of the macro expansion.

# Arguments
- `location`: the location within a source file that will be decomposed
into its parts.

- `file`: [out] if non-NULL, will be set to the file to which the given
source location points.

- `line`: [out] if non-NULL, will be set to the line to which the given
source location points.

- `column`: [out] if non-NULL, will be set to the column to which the given
source location points.

- `offset`: [out] if non-NULL, will be set to the offset into the
buffer to which the given source location points.
"""
function clang_getExpansionLocation(location, file, line, column, offset)
    ccall((:clang_getExpansionLocation, libclang), Cvoid, (CXSourceLocation, Ptr{CXFile}, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}), location, file, line, column, offset)
end

"""
    clang_getPresumedLocation(location, filename, line, column)

Retrieve the file, line and column represented by the given source
location, as specified in a # line directive.

Example: given the following source code in a file somefile.c

\\code
#123 \"dummy.c\" 1

static int func(void)
{
    return 0;
}
\\endcode

the location information returned by this function would be

File: dummy.c Line: 124 Column: 12

whereas clang_getExpansionLocation would have returned

File: somefile.c Line: 3 Column: 12

# Arguments
- `location`: the location within a source file that will be decomposed
into its parts.

- `filename`: [out] if non-NULL, will be set to the filename of the
source location. Note that filenames returned will be for \"virtual\" files,
which don't necessarily exist on the machine running clang - e.g. when
parsing preprocessed output obtained from a different environment. If
a non-NULL value is passed in, remember to dispose of the returned value
using `clang_disposeString()` once you've finished with it. For an invalid
source location, an empty string is returned.

- `line`: [out] if non-NULL, will be set to the line number of the
source location. For an invalid source location, zero is returned.

- `column`: [out] if non-NULL, will be set to the column number of the
source location. For an invalid source location, zero is returned.
"""
function clang_getPresumedLocation(location, filename, line, column)
    ccall((:clang_getPresumedLocation, libclang), Cvoid, (CXSourceLocation, Ptr{CXString}, Ptr{UInt32}, Ptr{UInt32}), location, filename, line, column)
end

"""
    clang_getInstantiationLocation(location, file, line, column, offset)

Legacy API to retrieve the file, line, column, and offset represented
by the given source location.

This interface has been replaced by the newer interface
#clang_getExpansionLocation(). See that interface's documentation for
details.
"""
function clang_getInstantiationLocation(location, file, line, column, offset)
    ccall((:clang_getInstantiationLocation, libclang), Cvoid, (CXSourceLocation, Ptr{CXFile}, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}), location, file, line, column, offset)
end

"""
    clang_getSpellingLocation(location, file, line, column, offset)

Retrieve the file, line, column, and offset represented by
the given source location.

If the location refers into a macro instantiation, return where the
location was originally spelled in the source file.

# Arguments
- `location`: the location within a source file that will be decomposed
into its parts.

- `file`: [out] if non-NULL, will be set to the file to which the given
source location points.

- `line`: [out] if non-NULL, will be set to the line to which the given
source location points.

- `column`: [out] if non-NULL, will be set to the column to which the given
source location points.

- `offset`: [out] if non-NULL, will be set to the offset into the
buffer to which the given source location points.
"""
function clang_getSpellingLocation(location, file, line, column, offset)
    ccall((:clang_getSpellingLocation, libclang), Cvoid, (CXSourceLocation, Ptr{CXFile}, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}), location, file, line, column, offset)
end

"""
    clang_getFileLocation(location, file, line, column, offset)

Retrieve the file, line, column, and offset represented by
the given source location.

If the location refers into a macro expansion, return where the macro was
expanded or where the macro argument was written, if the location points at
a macro argument.

# Arguments
- `location`: the location within a source file that will be decomposed
into its parts.

- `file`: [out] if non-NULL, will be set to the file to which the given
source location points.

- `line`: [out] if non-NULL, will be set to the line to which the given
source location points.

- `column`: [out] if non-NULL, will be set to the column to which the given
source location points.

- `offset`: [out] if non-NULL, will be set to the offset into the
buffer to which the given source location points.
"""
function clang_getFileLocation(location, file, line, column, offset)
    ccall((:clang_getFileLocation, libclang), Cvoid, (CXSourceLocation, Ptr{CXFile}, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}), location, file, line, column, offset)
end

"""
    clang_getRangeStart(range)

Retrieve a source location representing the first character within a
source range.
"""
function clang_getRangeStart(range)
    ccall((:clang_getRangeStart, libclang), CXSourceLocation, (CXSourceRange,), range)
end

"""
    clang_getRangeEnd(range)

Retrieve a source location representing the last character within a
source range.
"""
function clang_getRangeEnd(range)
    ccall((:clang_getRangeEnd, libclang), CXSourceLocation, (CXSourceRange,), range)
end

"""
    clang_getSkippedRanges(tu, file)

Retrieve all ranges that were skipped by the preprocessor.

The preprocessor will skip lines when they are surrounded by an
if/ifdef/ifndef directive whose condition does not evaluate to true.
"""
function clang_getSkippedRanges(tu, file)
    ccall((:clang_getSkippedRanges, libclang), Ptr{CXSourceRangeList}, (CXTranslationUnit, CXFile), tu, file)
end

"""
    clang_getAllSkippedRanges(tu)

Retrieve all ranges from all files that were skipped by the
preprocessor.

The preprocessor will skip lines when they are surrounded by an
if/ifdef/ifndef directive whose condition does not evaluate to true.
"""
function clang_getAllSkippedRanges(tu)
    ccall((:clang_getAllSkippedRanges, libclang), Ptr{CXSourceRangeList}, (CXTranslationUnit,), tu)
end

"""
    clang_disposeSourceRangeList(ranges)

Destroy the given `CXSourceRangeList` 
"""
function clang_disposeSourceRangeList(ranges)
    ccall((:clang_disposeSourceRangeList, libclang), Cvoid, (Ptr{CXSourceRangeList},), ranges)
end

"""
    clang_getNumDiagnosticsInSet(Diags)

Determine the number of diagnostics in a CXDiagnosticSet.
"""
function clang_getNumDiagnosticsInSet(Diags)
    ccall((:clang_getNumDiagnosticsInSet, libclang), UInt32, (CXDiagnosticSet,), Diags)
end

"""
    clang_getDiagnosticInSet(Diags, Index)

Retrieve a diagnostic associated with the given CXDiagnosticSet.

# Arguments
- `Diags`: the CXDiagnosticSet to query.
- `Index`: the zero-based diagnostic number to retrieve.

# Return
- the requested diagnostic. This diagnostic must be freed
via a call to `clang_disposeDiagnostic()` 
"""
function clang_getDiagnosticInSet(Diags, Index)
    ccall((:clang_getDiagnosticInSet, libclang), CXDiagnostic, (CXDiagnosticSet, UInt32), Diags, Index)
end

"""
    clang_loadDiagnostics(file, error, errorString)

Deserialize a set of diagnostics from a Clang diagnostics bitcode
file.

# Arguments
- `file`: The name of the file to deserialize.
- `error`: A pointer to a enum value recording if there was a problem
       deserializing the diagnostics.
- `errorString`: A pointer to a CXString for recording the error string
       if the file was not successfully loaded.

# Return
- A loaded CXDiagnosticSet if successful, and NULL otherwise.  These
diagnostics should be released using clang_disposeDiagnosticSet().
"""
function clang_loadDiagnostics(file, error, errorString)
    ccall((:clang_loadDiagnostics, libclang), CXDiagnosticSet, (Cstring, Ptr{CXLoadDiag_Error}, Ptr{CXString}), file, error, errorString)
end

"""
    clang_disposeDiagnosticSet(Diags)

Release a CXDiagnosticSet and all of its contained diagnostics.
"""
function clang_disposeDiagnosticSet(Diags)
    ccall((:clang_disposeDiagnosticSet, libclang), Cvoid, (CXDiagnosticSet,), Diags)
end

"""
    clang_getChildDiagnostics(D)

Retrieve the child diagnostics of a CXDiagnostic. 

This CXDiagnosticSet does not need to be released by
clang_disposeDiagnosticSet.
"""
function clang_getChildDiagnostics(D)
    ccall((:clang_getChildDiagnostics, libclang), CXDiagnosticSet, (CXDiagnostic,), D)
end

"""
    clang_getNumDiagnostics(Unit)

Determine the number of diagnostics produced for the given
translation unit.
"""
function clang_getNumDiagnostics(Unit)
    ccall((:clang_getNumDiagnostics, libclang), UInt32, (CXTranslationUnit,), Unit)
end

"""
    clang_getDiagnostic(Unit, Index)

Retrieve a diagnostic associated with the given translation unit.

# Arguments
- `Unit`: the translation unit to query.
- `Index`: the zero-based diagnostic number to retrieve.

# Return
- the requested diagnostic. This diagnostic must be freed
via a call to `clang_disposeDiagnostic()` 
"""
function clang_getDiagnostic(Unit, Index)
    ccall((:clang_getDiagnostic, libclang), CXDiagnostic, (CXTranslationUnit, UInt32), Unit, Index)
end

"""
    clang_getDiagnosticSetFromTU(Unit)

Retrieve the complete set of diagnostics associated with a
       translation unit.

# Arguments
- `Unit`: the translation unit to query.
"""
function clang_getDiagnosticSetFromTU(Unit)
    ccall((:clang_getDiagnosticSetFromTU, libclang), CXDiagnosticSet, (CXTranslationUnit,), Unit)
end

"""
    clang_disposeDiagnostic(Diagnostic)

Destroy a diagnostic.
"""
function clang_disposeDiagnostic(Diagnostic)
    ccall((:clang_disposeDiagnostic, libclang), Cvoid, (CXDiagnostic,), Diagnostic)
end

"""
    clang_formatDiagnostic(Diagnostic, Options)

Format the given diagnostic in a manner that is suitable for display.

This routine will format the given diagnostic to a string, rendering
the diagnostic according to the various options given. The
`clang_defaultDiagnosticDisplayOptions()` function returns the set of
options that most closely mimics the behavior of the clang compiler.

# Arguments
- `Diagnostic`: The diagnostic to print.

- `Options`: A set of options that control the diagnostic display,
created by combining `CXDiagnosticDisplayOptions` values.

# Return
- A new string containing for formatted diagnostic.
"""
function clang_formatDiagnostic(Diagnostic, Options)
    ccall((:clang_formatDiagnostic, libclang), CXString, (CXDiagnostic, UInt32), Diagnostic, Options)
end

"""
    clang_defaultDiagnosticDisplayOptions()

Retrieve the set of display options most similar to the
default behavior of the clang compiler.

# Return
- A set of display options suitable for use with \\c
clang_formatDiagnostic().
"""
function clang_defaultDiagnosticDisplayOptions()
    ccall((:clang_defaultDiagnosticDisplayOptions, libclang), UInt32, ())
end

"""
    clang_getDiagnosticSeverity(arg1)

Determine the severity of the given diagnostic.
"""
function clang_getDiagnosticSeverity(arg1)
    ccall((:clang_getDiagnosticSeverity, libclang), CXDiagnosticSeverity, (CXDiagnostic,), arg1)
end

"""
    clang_getDiagnosticLocation(arg1)

Retrieve the source location of the given diagnostic.

This location is where Clang would print the caret ('^') when
displaying the diagnostic on the command line.
"""
function clang_getDiagnosticLocation(arg1)
    ccall((:clang_getDiagnosticLocation, libclang), CXSourceLocation, (CXDiagnostic,), arg1)
end

"""
    clang_getDiagnosticSpelling(arg1)

Retrieve the text of the given diagnostic.
"""
function clang_getDiagnosticSpelling(arg1)
    ccall((:clang_getDiagnosticSpelling, libclang), CXString, (CXDiagnostic,), arg1)
end

"""
    clang_getDiagnosticOption(Diag, Disable)

Retrieve the name of the command-line option that enabled this
diagnostic.

# Arguments
- `Diag`: The diagnostic to be queried.

- `Disable`: If non-NULL, will be set to the option that disables this
diagnostic (if any).

# Return
- A string that contains the command-line option used to enable this
warning, such as \"-Wconversion\" or \"-pedantic\". 
"""
function clang_getDiagnosticOption(Diag, Disable)
    ccall((:clang_getDiagnosticOption, libclang), CXString, (CXDiagnostic, Ptr{CXString}), Diag, Disable)
end

"""
    clang_getDiagnosticCategory(arg1)

Retrieve the category number for this diagnostic.

Diagnostics can be categorized into groups along with other, related
diagnostics (e.g., diagnostics under the same warning flag). This routine 
retrieves the category number for the given diagnostic.

# Return
- The number of the category that contains this diagnostic, or zero
if this diagnostic is uncategorized.
"""
function clang_getDiagnosticCategory(arg1)
    ccall((:clang_getDiagnosticCategory, libclang), UInt32, (CXDiagnostic,), arg1)
end

"""
    clang_getDiagnosticCategoryName(Category)

Retrieve the name of a particular diagnostic category.  This
 is now deprecated.  Use clang_getDiagnosticCategoryText()
 instead.

# Arguments
- `Category`: A diagnostic category number, as returned by 
`clang_getDiagnosticCategory()` 

# Return
- The name of the given diagnostic category.
"""
function clang_getDiagnosticCategoryName(Category)
    ccall((:clang_getDiagnosticCategoryName, libclang), CXString, (UInt32,), Category)
end

"""
    clang_getDiagnosticCategoryText(arg1)

Retrieve the diagnostic category text for a given diagnostic.

# Return
- The text of the given diagnostic category.
"""
function clang_getDiagnosticCategoryText(arg1)
    ccall((:clang_getDiagnosticCategoryText, libclang), CXString, (CXDiagnostic,), arg1)
end

"""
    clang_getDiagnosticNumRanges(arg1)

Determine the number of source ranges associated with the given
diagnostic.
"""
function clang_getDiagnosticNumRanges(arg1)
    ccall((:clang_getDiagnosticNumRanges, libclang), UInt32, (CXDiagnostic,), arg1)
end

"""
    clang_getDiagnosticRange(Diagnostic, Range)

Retrieve a source range associated with the diagnostic.

A diagnostic's source ranges highlight important elements in the source
code. On the command line, Clang displays source ranges by
underlining them with '~' characters.

# Arguments
- `Diagnostic`: the diagnostic whose range is being extracted.

- `Range`: the zero-based index specifying which range to

# Return
- the requested source range.
"""
function clang_getDiagnosticRange(Diagnostic, Range)
    ccall((:clang_getDiagnosticRange, libclang), CXSourceRange, (CXDiagnostic, UInt32), Diagnostic, Range)
end

"""
    clang_getDiagnosticNumFixIts(Diagnostic)

Determine the number of fix-it hints associated with the
given diagnostic.
"""
function clang_getDiagnosticNumFixIts(Diagnostic)
    ccall((:clang_getDiagnosticNumFixIts, libclang), UInt32, (CXDiagnostic,), Diagnostic)
end

"""
    clang_getDiagnosticFixIt(Diagnostic, FixIt, ReplacementRange)

Retrieve the replacement information for a given fix-it.

Fix-its are described in terms of a source range whose contents
should be replaced by a string. This approach generalizes over
three kinds of operations: removal of source code (the range covers
the code to be removed and the replacement string is empty),
replacement of source code (the range covers the code to be
replaced and the replacement string provides the new code), and
insertion (both the start and end of the range point at the
insertion location, and the replacement string provides the text to
insert).

# Arguments
- `Diagnostic`: The diagnostic whose fix-its are being queried.

- `FixIt`: The zero-based index of the fix-it.

- `ReplacementRange`: The source range whose contents will be
replaced with the returned replacement string. Note that source
ranges are half-open ranges [a, b), so the source code should be
replaced from a and up to (but not including) b.

# Return
- A string containing text that should be replace the source
code indicated by the `ReplacementRange` 
"""
function clang_getDiagnosticFixIt(Diagnostic, FixIt, ReplacementRange)
    ccall((:clang_getDiagnosticFixIt, libclang), CXString, (CXDiagnostic, UInt32, Ptr{CXSourceRange}), Diagnostic, FixIt, ReplacementRange)
end

"""
    clang_getTranslationUnitSpelling(CTUnit)

Get the original translation unit source file name.
"""
function clang_getTranslationUnitSpelling(CTUnit)
    ccall((:clang_getTranslationUnitSpelling, libclang), CXString, (CXTranslationUnit,), CTUnit)
end

"""
    clang_createTranslationUnitFromSourceFile(CIdx, source_filename, num_clang_command_line_args, clang_command_line_args, num_unsaved_files, unsaved_files)

Return the CXTranslationUnit for a given source file and the provided
command line arguments one would pass to the compiler.

Note: The 'source_filename' argument is optional.  If the caller provides a
NULL pointer, the name of the source file is expected to reside in the
specified command line arguments.

Note: When encountered in 'clang_command_line_args', the following options
are ignored:

  '-c'
  '-emit-ast'
  '-fsyntax-only'
  '-o \\<output file>'  (both '-o' and '\\<output file>' are ignored)

# Arguments
- `CIdx`: The index object with which the translation unit will be
associated.

- `source_filename`: The name of the source file to load, or NULL if the
source file is included in \\p clang_command_line_args.

- `num_clang_command_line_args`: The number of command-line arguments in
\\p clang_command_line_args.

- `clang_command_line_args`: The command-line arguments that would be
passed to the `clang` executable if it were being invoked out-of-process.
These command-line options will be parsed and will affect how the translation
unit is parsed. Note that the following options are ignored: '-c',
'-emit-ast', '-fsyntax-only' (which is the default), and '-o \\<output file>'.

- `num_unsaved_files`: the number of unsaved file entries in \\p
unsaved_files.

- `unsaved_files`: the files that have not yet been saved to disk
but may be required for code completion, including the contents of
those files.  The contents and name of these files (as specified by
CXUnsavedFile) are copied when necessary, so the client only needs to
guarantee their validity until the call to this function returns.
"""
function clang_createTranslationUnitFromSourceFile(CIdx, source_filename, num_clang_command_line_args, clang_command_line_args, num_unsaved_files, unsaved_files)
    ccall((:clang_createTranslationUnitFromSourceFile, libclang), CXTranslationUnit, (CXIndex, Cstring, Cint, Ptr{Cstring}, UInt32, Ptr{CXUnsavedFile}), CIdx, source_filename, num_clang_command_line_args, clang_command_line_args, num_unsaved_files, unsaved_files)
end

"""
    clang_createTranslationUnit(CIdx, ast_filename)

Same as `clang_createTranslationUnit2,` but returns
the `CXTranslationUnit` instead of an error code.  In case of an error this
routine returns a `NULL` `CXTranslationUnit,` without further detailed
error codes.
"""
function clang_createTranslationUnit(CIdx, ast_filename)
    ccall((:clang_createTranslationUnit, libclang), CXTranslationUnit, (CXIndex, Cstring), CIdx, ast_filename)
end

"""
    clang_createTranslationUnit2(CIdx, ast_filename, out_TU)

Create a translation unit from an AST file (`-emit-ast)` 

\\param[out] out_TU A non-NULL pointer to store the created
`CXTranslationUnit` 

# Return
- Zero on success, otherwise returns an error code.
"""
function clang_createTranslationUnit2(CIdx, ast_filename, out_TU)
    ccall((:clang_createTranslationUnit2, libclang), CXErrorCode, (CXIndex, Cstring, Ptr{CXTranslationUnit}), CIdx, ast_filename, out_TU)
end

"""
    clang_defaultEditingTranslationUnitOptions()

Returns the set of flags that is suitable for parsing a translation
unit that is being edited.

The set of flags returned provide options for `clang_parseTranslationUnit(` 
to indicate that the translation unit is likely to be reparsed many times,
either explicitly (via `clang_reparseTranslationUnit())` or implicitly
(e.g., by code completion (`clang_codeCompletionAt())).` The returned flag
set contains an unspecified set of optimizations (e.g., the precompiled 
preamble) geared toward improving the performance of these routines. The
set of optimizations enabled may change from one version to the next.
"""
function clang_defaultEditingTranslationUnitOptions()
    ccall((:clang_defaultEditingTranslationUnitOptions, libclang), UInt32, ())
end

"""
    clang_parseTranslationUnit(CIdx, source_filename, command_line_args, num_command_line_args, unsaved_files, num_unsaved_files, options)

Same as `clang_parseTranslationUnit2,` but returns
the `CXTranslationUnit` instead of an error code.  In case of an error this
routine returns a `NULL` `CXTranslationUnit,` without further detailed
error codes.
"""
function clang_parseTranslationUnit(CIdx, source_filename, command_line_args, num_command_line_args, unsaved_files, num_unsaved_files, options)
    ccall((:clang_parseTranslationUnit, libclang), CXTranslationUnit, (CXIndex, Cstring, Ptr{Cstring}, Cint, Ptr{CXUnsavedFile}, UInt32, UInt32), CIdx, source_filename, command_line_args, num_command_line_args, unsaved_files, num_unsaved_files, options)
end

"""
    clang_parseTranslationUnit2(CIdx, source_filename, command_line_args, num_command_line_args, unsaved_files, num_unsaved_files, options, out_TU)

Parse the given source file and the translation unit corresponding
to that file.

This routine is the main entry point for the Clang C API, providing the
ability to parse a source file into a translation unit that can then be
queried by other functions in the API. This routine accepts a set of
command-line arguments so that the compilation can be configured in the same
way that the compiler is configured on the command line.

# Arguments
- `CIdx`: The index object with which the translation unit will be 
associated.

- `source_filename`: The name of the source file to load, or NULL if the
source file is included in `command_line_args` 

- `command_line_args`: The command-line arguments that would be
passed to the `clang` executable if it were being invoked out-of-process.
These command-line options will be parsed and will affect how the translation
unit is parsed. Note that the following options are ignored: '-c', 
'-emit-ast', '-fsyntax-only' (which is the default), and '-o \\<output file>'.

- `num_command_line_args`: The number of command-line arguments in
`command_line_args` 

- `unsaved_files`: the files that have not yet been saved to disk
but may be required for parsing, including the contents of
those files.  The contents and name of these files (as specified by
CXUnsavedFile) are copied when necessary, so the client only needs to
guarantee their validity until the call to this function returns.

- `num_unsaved_files`: the number of unsaved file entries in \\p
unsaved_files.

- `options`: A bitmask of options that affects how the translation unit
is managed but not its compilation. This should be a bitwise OR of the
CXTranslationUnit_XXX flags.

\\param[out] out_TU A non-NULL pointer to store the created
`CXTranslationUnit,` describing the parsed code and containing any
diagnostics produced by the compiler.

# Return
- Zero on success, otherwise returns an error code.
"""
function clang_parseTranslationUnit2(CIdx, source_filename, command_line_args, num_command_line_args, unsaved_files, num_unsaved_files, options, out_TU)
    ccall((:clang_parseTranslationUnit2, libclang), CXErrorCode, (CXIndex, Cstring, Ptr{Cstring}, Cint, Ptr{CXUnsavedFile}, UInt32, UInt32, Ptr{CXTranslationUnit}), CIdx, source_filename, command_line_args, num_command_line_args, unsaved_files, num_unsaved_files, options, out_TU)
end

"""
    clang_parseTranslationUnit2FullArgv(CIdx, source_filename, command_line_args, num_command_line_args, unsaved_files, num_unsaved_files, options, out_TU)

Same as clang_parseTranslationUnit2 but requires a full command line
for `command_line_args` including argv[0]. This is useful if the standard
library paths are relative to the binary.
"""
function clang_parseTranslationUnit2FullArgv(CIdx, source_filename, command_line_args, num_command_line_args, unsaved_files, num_unsaved_files, options, out_TU)
    ccall((:clang_parseTranslationUnit2FullArgv, libclang), CXErrorCode, (CXIndex, Cstring, Ptr{Cstring}, Cint, Ptr{CXUnsavedFile}, UInt32, UInt32, Ptr{CXTranslationUnit}), CIdx, source_filename, command_line_args, num_command_line_args, unsaved_files, num_unsaved_files, options, out_TU)
end

"""
    clang_defaultSaveOptions(TU)

Returns the set of flags that is suitable for saving a translation
unit.

The set of flags returned provide options for
`clang_saveTranslationUnit()` by default. The returned flag
set contains an unspecified set of options that save translation units with
the most commonly-requested data.
"""
function clang_defaultSaveOptions(TU)
    ccall((:clang_defaultSaveOptions, libclang), UInt32, (CXTranslationUnit,), TU)
end

"""
    clang_saveTranslationUnit(TU, FileName, options)

Saves a translation unit into a serialized representation of
that translation unit on disk.

Any translation unit that was parsed without error can be saved
into a file. The translation unit can then be deserialized into a
new `CXTranslationUnit` with `clang_createTranslationUnit()` or,
if it is an incomplete translation unit that corresponds to a
header, used as a precompiled header when parsing other translation
units.

# Arguments
- `TU`: The translation unit to save.

- `FileName`: The file to which the translation unit will be saved.

- `options`: A bitmask of options that affects how the translation unit
is saved. This should be a bitwise OR of the
CXSaveTranslationUnit_XXX flags.

# Return
- A value that will match one of the enumerators of the CXSaveError
enumeration. Zero (CXSaveError_None) indicates that the translation unit was 
saved successfully, while a non-zero value indicates that a problem occurred.
"""
function clang_saveTranslationUnit(TU, FileName, options)
    ccall((:clang_saveTranslationUnit, libclang), Cint, (CXTranslationUnit, Cstring, UInt32), TU, FileName, options)
end

"""
    clang_suspendTranslationUnit(arg1)

Suspend a translation unit in order to free memory associated with it.

A suspended translation unit uses significantly less memory but on the other
side does not support any other calls than \\c clang_reparseTranslationUnit
to resume it or `clang_disposeTranslationUnit` to dispose it completely.
"""
function clang_suspendTranslationUnit(arg1)
    ccall((:clang_suspendTranslationUnit, libclang), UInt32, (CXTranslationUnit,), arg1)
end

"""
    clang_disposeTranslationUnit(arg1)

Destroy the specified CXTranslationUnit object.
"""
function clang_disposeTranslationUnit(arg1)
    ccall((:clang_disposeTranslationUnit, libclang), Cvoid, (CXTranslationUnit,), arg1)
end

"""
    clang_defaultReparseOptions(TU)

Returns the set of flags that is suitable for reparsing a translation
unit.

The set of flags returned provide options for
`clang_reparseTranslationUnit()` by default. The returned flag
set contains an unspecified set of optimizations geared toward common uses
of reparsing. The set of optimizations enabled may change from one version 
to the next.
"""
function clang_defaultReparseOptions(TU)
    ccall((:clang_defaultReparseOptions, libclang), UInt32, (CXTranslationUnit,), TU)
end

"""
    clang_reparseTranslationUnit(TU, num_unsaved_files, unsaved_files, options)

Reparse the source files that produced this translation unit.

This routine can be used to re-parse the source files that originally
created the given translation unit, for example because those source files
have changed (either on disk or as passed via \\p unsaved_files). The
source code will be reparsed with the same command-line options as it
was originally parsed. 

Reparsing a translation unit invalidates all cursors and source locations
that refer into that translation unit. This makes reparsing a translation
unit semantically equivalent to destroying the translation unit and then
creating a new translation unit with the same command-line arguments.
However, it may be more efficient to reparse a translation 
unit using this routine.

# Arguments
- `TU`: The translation unit whose contents will be re-parsed. The
translation unit must originally have been built with 
`clang_createTranslationUnitFromSourceFile()` 

- `num_unsaved_files`: The number of unsaved file entries in \\p
unsaved_files.

- `unsaved_files`: The files that have not yet been saved to disk
but may be required for parsing, including the contents of
those files.  The contents and name of these files (as specified by
CXUnsavedFile) are copied when necessary, so the client only needs to
guarantee their validity until the call to this function returns.

- `options`: A bitset of options composed of the flags in CXReparse_Flags.
The function `clang_defaultReparseOptions()` produces a default set of
options recommended for most uses, based on the translation unit.

# Return
- 0 if the sources could be reparsed.  A non-zero error code will be
returned if reparsing was impossible, such that the translation unit is
invalid. In such cases, the only valid call for `TU` is
`clang_disposeTranslationUnit(TU).`  The error codes returned by this
routine are described by the `CXErrorCode` enum.
"""
function clang_reparseTranslationUnit(TU, num_unsaved_files, unsaved_files, options)
    ccall((:clang_reparseTranslationUnit, libclang), Cint, (CXTranslationUnit, UInt32, Ptr{CXUnsavedFile}, UInt32), TU, num_unsaved_files, unsaved_files, options)
end

"""
    clang_getTUResourceUsageName(kind)

 Returns the human-readable null-terminated C string that represents
  the name of the memory category.  This string should never be freed.
 /
"""
function clang_getTUResourceUsageName(kind)
    ccall((:clang_getTUResourceUsageName, libclang), Cstring, (CXTUResourceUsageKind,), kind)
end

"""
    clang_getCXTUResourceUsage(TU)

 Return the memory usage of a translation unit.  This object
  should be released with clang_disposeCXTUResourceUsage().
 /
"""
function clang_getCXTUResourceUsage(TU)
    ccall((:clang_getCXTUResourceUsage, libclang), CXTUResourceUsage, (CXTranslationUnit,), TU)
end

"""
    clang_disposeCXTUResourceUsage(usage)

"""
function clang_disposeCXTUResourceUsage(usage)
    ccall((:clang_disposeCXTUResourceUsage, libclang), Cvoid, (CXTUResourceUsage,), usage)
end

"""
    clang_getTranslationUnitTargetInfo(CTUnit)

Get target information for this translation unit.

The CXTargetInfo object cannot outlive the CXTranslationUnit object.
"""
function clang_getTranslationUnitTargetInfo(CTUnit)
    ccall((:clang_getTranslationUnitTargetInfo, libclang), CXTargetInfo, (CXTranslationUnit,), CTUnit)
end

"""
    clang_TargetInfo_dispose(Info)

Destroy the CXTargetInfo object.
"""
function clang_TargetInfo_dispose(Info)
    ccall((:clang_TargetInfo_dispose, libclang), Cvoid, (CXTargetInfo,), Info)
end

"""
    clang_TargetInfo_getTriple(Info)

Get the normalized target triple as a string.

Returns the empty string in case of any error.
"""
function clang_TargetInfo_getTriple(Info)
    ccall((:clang_TargetInfo_getTriple, libclang), CXString, (CXTargetInfo,), Info)
end

"""
    clang_TargetInfo_getPointerWidth(Info)

Get the pointer width of the target in bits.

Returns -1 in case of error.
"""
function clang_TargetInfo_getPointerWidth(Info)
    ccall((:clang_TargetInfo_getPointerWidth, libclang), Cint, (CXTargetInfo,), Info)
end

"""
    clang_getNullCursor()

Retrieve the NULL cursor, which represents no entity.
"""
function clang_getNullCursor()
    ccall((:clang_getNullCursor, libclang), CXCursor, ())
end

"""
    clang_getTranslationUnitCursor(arg1)

Retrieve the cursor that represents the given translation unit.

The translation unit cursor can be used to start traversing the
various declarations within the given translation unit.
"""
function clang_getTranslationUnitCursor(arg1)
    ccall((:clang_getTranslationUnitCursor, libclang), CXCursor, (CXTranslationUnit,), arg1)
end

"""
    clang_equalCursors(arg1, arg2)

Determine whether two cursors are equivalent.
"""
function clang_equalCursors(arg1, arg2)
    ccall((:clang_equalCursors, libclang), UInt32, (CXCursor, CXCursor), arg1, arg2)
end

"""
    clang_Cursor_isNull(cursor)

Returns non-zero if \\p cursor is null.
"""
function clang_Cursor_isNull(cursor)
    ccall((:clang_Cursor_isNull, libclang), Cint, (CXCursor,), cursor)
end

"""
    clang_hashCursor(arg1)

Compute a hash value for the given cursor.
"""
function clang_hashCursor(arg1)
    ccall((:clang_hashCursor, libclang), UInt32, (CXCursor,), arg1)
end

"""
    clang_getCursorKind(arg1)

Retrieve the kind of the given cursor.
"""
function clang_getCursorKind(arg1)
    ccall((:clang_getCursorKind, libclang), CXCursorKind, (CXCursor,), arg1)
end

"""
    clang_isDeclaration(arg1)

Determine whether the given cursor kind represents a declaration.
"""
function clang_isDeclaration(arg1)
    ccall((:clang_isDeclaration, libclang), UInt32, (CXCursorKind,), arg1)
end

"""
    clang_isReference(arg1)

Determine whether the given cursor kind represents a simple
reference.

Note that other kinds of cursors (such as expressions) can also refer to
other cursors. Use clang_getCursorReferenced() to determine whether a
particular cursor refers to another entity.
"""
function clang_isReference(arg1)
    ccall((:clang_isReference, libclang), UInt32, (CXCursorKind,), arg1)
end

"""
    clang_isExpression(arg1)

Determine whether the given cursor kind represents an expression.
"""
function clang_isExpression(arg1)
    ccall((:clang_isExpression, libclang), UInt32, (CXCursorKind,), arg1)
end

"""
    clang_isStatement(arg1)

Determine whether the given cursor kind represents a statement.
"""
function clang_isStatement(arg1)
    ccall((:clang_isStatement, libclang), UInt32, (CXCursorKind,), arg1)
end

"""
    clang_isAttribute(arg1)

Determine whether the given cursor kind represents an attribute.
"""
function clang_isAttribute(arg1)
    ccall((:clang_isAttribute, libclang), UInt32, (CXCursorKind,), arg1)
end

"""
    clang_Cursor_hasAttrs(C)

Determine whether the given cursor has any attributes.
"""
function clang_Cursor_hasAttrs(C)
    ccall((:clang_Cursor_hasAttrs, libclang), UInt32, (CXCursor,), C)
end

"""
    clang_isInvalid(arg1)

Determine whether the given cursor kind represents an invalid
cursor.
"""
function clang_isInvalid(arg1)
    ccall((:clang_isInvalid, libclang), UInt32, (CXCursorKind,), arg1)
end

"""
    clang_isTranslationUnit(arg1)

Determine whether the given cursor kind represents a translation
unit.
"""
function clang_isTranslationUnit(arg1)
    ccall((:clang_isTranslationUnit, libclang), UInt32, (CXCursorKind,), arg1)
end

"""
    clang_isPreprocessing(arg1)
*
Determine whether the given cursor represents a preprocessing
element, such as a preprocessor directive or macro instantiation.
"""
function clang_isPreprocessing(arg1)
    ccall((:clang_isPreprocessing, libclang), UInt32, (CXCursorKind,), arg1)
end

"""
    clang_isUnexposed(arg1)
*
Determine whether the given cursor represents a currently
 unexposed piece of the AST (e.g., CXCursor_UnexposedStmt).
"""
function clang_isUnexposed(arg1)
    ccall((:clang_isUnexposed, libclang), UInt32, (CXCursorKind,), arg1)
end

"""
    clang_getCursorLinkage(cursor)

Determine the linkage of the entity referred to by a given cursor.
"""
function clang_getCursorLinkage(cursor)
    ccall((:clang_getCursorLinkage, libclang), CXLinkageKind, (CXCursor,), cursor)
end

"""
    clang_getCursorVisibility(cursor)

Describe the visibility of the entity referred to by a cursor.

This returns the default visibility if not explicitly specified by
a visibility attribute. The default visibility may be changed by
commandline arguments.

# Arguments
- `cursor`: The cursor to query.

# Return
- The visibility of the cursor.
"""
function clang_getCursorVisibility(cursor)
    ccall((:clang_getCursorVisibility, libclang), CXVisibilityKind, (CXCursor,), cursor)
end

"""
    clang_getCursorAvailability(cursor)

Determine the availability of the entity that this cursor refers to,
taking the current target platform into account.

# Arguments
- `cursor`: The cursor to query.

# Return
- The availability of the cursor.
"""
function clang_getCursorAvailability(cursor)
    ccall((:clang_getCursorAvailability, libclang), CXAvailabilityKind, (CXCursor,), cursor)
end

"""
    clang_getCursorPlatformAvailability(cursor, always_deprecated, deprecated_message, always_unavailable, unavailable_message, availability, availability_size)

Determine the availability of the entity that this cursor refers to
on any platforms for which availability information is known.

# Arguments
- `cursor`: The cursor to query.

- `always_deprecated`: If non-NULL, will be set to indicate whether the 
entity is deprecated on all platforms.

- `deprecated_message`: If non-NULL, will be set to the message text 
provided along with the unconditional deprecation of this entity. The client
is responsible for deallocating this string.

- `always_unavailable`: If non-NULL, will be set to indicate whether the
entity is unavailable on all platforms.

- `unavailable_message`: If non-NULL, will be set to the message text
provided along with the unconditional unavailability of this entity. The 
client is responsible for deallocating this string.

- `availability`: If non-NULL, an array of CXPlatformAvailability instances
that will be populated with platform availability information, up to either
the number of platforms for which availability information is available (as
returned by this function) or `availability_size,` whichever is smaller.

- `availability_size`: The number of elements available in the 
`availability` array.

# Return
- The number of platforms (N) for which availability information is
available (which is unrelated to `availability_size)` 

Note that the client is responsible for calling 
`clang_disposeCXPlatformAvailability` to free each of the 
platform-availability structures returned. There are 
`min(N,` availability_size) such structures.
"""
function clang_getCursorPlatformAvailability(cursor, always_deprecated, deprecated_message, always_unavailable, unavailable_message, availability, availability_size)
    ccall((:clang_getCursorPlatformAvailability, libclang), Cint, (CXCursor, Ptr{Cint}, Ptr{CXString}, Ptr{Cint}, Ptr{CXString}, Ptr{CXPlatformAvailability}, Cint), cursor, always_deprecated, deprecated_message, always_unavailable, unavailable_message, availability, availability_size)
end

"""
    clang_disposeCXPlatformAvailability(availability)

Free the memory associated with a `CXPlatformAvailability` structure.
"""
function clang_disposeCXPlatformAvailability(availability)
    ccall((:clang_disposeCXPlatformAvailability, libclang), Cvoid, (Ptr{CXPlatformAvailability},), availability)
end

"""
    clang_getCursorLanguage(cursor)

Determine the \"language\" of the entity referred to by a given cursor.
"""
function clang_getCursorLanguage(cursor)
    ccall((:clang_getCursorLanguage, libclang), CXLanguageKind, (CXCursor,), cursor)
end

"""
    clang_getCursorTLSKind(cursor)

Determine the \"thread-local storage (TLS) kind\" of the declaration
referred to by a cursor.
"""
function clang_getCursorTLSKind(cursor)
    ccall((:clang_getCursorTLSKind, libclang), CXTLSKind, (CXCursor,), cursor)
end

"""
    clang_Cursor_getTranslationUnit(arg1)

Returns the translation unit that a cursor originated from.
"""
function clang_Cursor_getTranslationUnit(arg1)
    ccall((:clang_Cursor_getTranslationUnit, libclang), CXTranslationUnit, (CXCursor,), arg1)
end

"""
    clang_createCXCursorSet()

Creates an empty CXCursorSet.
"""
function clang_createCXCursorSet()
    ccall((:clang_createCXCursorSet, libclang), CXCursorSet, ())
end

"""
    clang_disposeCXCursorSet(cset)

Disposes a CXCursorSet and releases its associated memory.
"""
function clang_disposeCXCursorSet(cset)
    ccall((:clang_disposeCXCursorSet, libclang), Cvoid, (CXCursorSet,), cset)
end

"""
    clang_CXCursorSet_contains(cset, cursor)

Queries a CXCursorSet to see if it contains a specific CXCursor.

# Return
- non-zero if the set contains the specified cursor.
*/
"""
function clang_CXCursorSet_contains(cset, cursor)
    ccall((:clang_CXCursorSet_contains, libclang), UInt32, (CXCursorSet, CXCursor), cset, cursor)
end

"""
    clang_CXCursorSet_insert(cset, cursor)

Inserts a CXCursor into a CXCursorSet.

# Return
- zero if the CXCursor was already in the set, and non-zero otherwise.
*/
"""
function clang_CXCursorSet_insert(cset, cursor)
    ccall((:clang_CXCursorSet_insert, libclang), UInt32, (CXCursorSet, CXCursor), cset, cursor)
end

"""
    clang_getCursorSemanticParent(cursor)

Determine the semantic parent of the given cursor.

The semantic parent of a cursor is the cursor that semantically contains
the given \\p cursor. For many declarations, the lexical and semantic parents
are equivalent (the lexical parent is returned by 
`clang_getCursorLexicalParent()).` They diverge when declarations or
definitions are provided out-of-line. For example:

\\code
class C {
 void f();
};

void C::f() { }
\\endcode

In the out-of-line definition of `C::f,` the semantic parent is
the class `C,` of which this function is a member. The lexical parent is
the place where the declaration actually occurs in the source code; in this
case, the definition occurs in the translation unit. In general, the
lexical parent for a given entity can change without affecting the semantics
of the program, and the lexical parent of different declarations of the
same entity may be different. Changing the semantic parent of a declaration,
on the other hand, can have a major impact on semantics, and redeclarations
of a particular entity should all have the same semantic context.

In the example above, both declarations of `C::f` have `C` as their
semantic context, while the lexical context of the first `C::f` is \\c C
and the lexical context of the second `C::f` is the translation unit.

For global declarations, the semantic parent is the translation unit.
"""
function clang_getCursorSemanticParent(cursor)
    ccall((:clang_getCursorSemanticParent, libclang), CXCursor, (CXCursor,), cursor)
end

"""
    clang_getCursorLexicalParent(cursor)

Determine the lexical parent of the given cursor.

The lexical parent of a cursor is the cursor in which the given \\p cursor
was actually written. For many declarations, the lexical and semantic parents
are equivalent (the semantic parent is returned by 
`clang_getCursorSemanticParent()).` They diverge when declarations or
definitions are provided out-of-line. For example:

\\code
class C {
 void f();
};

void C::f() { }
\\endcode

In the out-of-line definition of `C::f,` the semantic parent is
the class `C,` of which this function is a member. The lexical parent is
the place where the declaration actually occurs in the source code; in this
case, the definition occurs in the translation unit. In general, the
lexical parent for a given entity can change without affecting the semantics
of the program, and the lexical parent of different declarations of the
same entity may be different. Changing the semantic parent of a declaration,
on the other hand, can have a major impact on semantics, and redeclarations
of a particular entity should all have the same semantic context.

In the example above, both declarations of `C::f` have `C` as their
semantic context, while the lexical context of the first `C::f` is \\c C
and the lexical context of the second `C::f` is the translation unit.

For declarations written in the global scope, the lexical parent is
the translation unit.
"""
function clang_getCursorLexicalParent(cursor)
    ccall((:clang_getCursorLexicalParent, libclang), CXCursor, (CXCursor,), cursor)
end

"""
    clang_getOverriddenCursors(cursor, overridden, num_overridden)

Determine the set of methods that are overridden by the given
method.

In both Objective-C and C++, a method (aka virtual member function,
in C++) can override a virtual method in a base class. For
Objective-C, a method is said to override any method in the class's
base class, its protocols, or its categories' protocols, that has the same
selector and is of the same kind (class or instance).
If no such method exists, the search continues to the class's superclass,
its protocols, and its categories, and so on. A method from an Objective-C
implementation is considered to override the same methods as its
corresponding method in the interface.

For C++, a virtual member function overrides any virtual member
function with the same signature that occurs in its base
classes. With multiple inheritance, a virtual member function can
override several virtual member functions coming from different
base classes.

In all cases, this function determines the immediate overridden
method, rather than all of the overridden methods. For example, if
a method is originally declared in a class A, then overridden in B
(which in inherits from A) and also in C (which inherited from B),
then the only overridden method returned from this function when
invoked on C's method will be B's method. The client may then
invoke this function again, given the previously-found overridden
methods, to map out the complete method-override set.

# Arguments
- `cursor`: A cursor representing an Objective-C or C++
method. This routine will compute the set of methods that this
method overrides.

- `overridden`: A pointer whose pointee will be replaced with a
pointer to an array of cursors, representing the set of overridden
methods. If there are no overridden methods, the pointee will be
set to NULL. The pointee must be freed via a call to 
`clang_disposeOverriddenCursors()` 

- `num_overridden`: A pointer to the number of overridden
functions, will be set to the number of overridden functions in the
array pointed to by \\p overridden.
"""
function clang_getOverriddenCursors(cursor, overridden, num_overridden)
    ccall((:clang_getOverriddenCursors, libclang), Cvoid, (CXCursor, Ptr{Ptr{CXCursor}}, Ptr{UInt32}), cursor, overridden, num_overridden)
end

"""
    clang_disposeOverriddenCursors(overridden)

Free the set of overridden cursors returned by \\c
clang_getOverriddenCursors().
"""
function clang_disposeOverriddenCursors(overridden)
    ccall((:clang_disposeOverriddenCursors, libclang), Cvoid, (Ptr{CXCursor},), overridden)
end

"""
    clang_getIncludedFile(cursor)

Retrieve the file that is included by the given inclusion directive
cursor.
"""
function clang_getIncludedFile(cursor)
    ccall((:clang_getIncludedFile, libclang), CXFile, (CXCursor,), cursor)
end

"""
    clang_getCursor(arg1, arg2)

Map a source location to the cursor that describes the entity at that
location in the source code.

clang_getCursor() maps an arbitrary source location within a translation
unit down to the most specific cursor that describes the entity at that
location. For example, given an expression `x` + y, invoking
clang_getCursor() with a source location pointing to \"x\" will return the
cursor for \"x\"; similarly for \"y\". If the cursor points anywhere between
\"x\" or \"y\" (e.g., on the + or the whitespace around it), clang_getCursor()
will return a cursor referring to the \"+\" expression.

# Return
- a cursor representing the entity at the given source location, or
a NULL cursor if no such entity can be found.
"""
function clang_getCursor(arg1, arg2)
    ccall((:clang_getCursor, libclang), CXCursor, (CXTranslationUnit, CXSourceLocation), arg1, arg2)
end

"""
    clang_getCursorLocation(arg1)

Retrieve the physical location of the source constructor referenced
by the given cursor.

The location of a declaration is typically the location of the name of that
declaration, where the name of that declaration would occur if it is
unnamed, or some keyword that introduces that particular declaration.
The location of a reference is where that reference occurs within the
source code.
"""
function clang_getCursorLocation(arg1)
    ccall((:clang_getCursorLocation, libclang), CXSourceLocation, (CXCursor,), arg1)
end

"""
    clang_getCursorExtent(arg1)

Retrieve the physical extent of the source construct referenced by
the given cursor.

The extent of a cursor starts with the file/line/column pointing at the
first character within the source construct that the cursor refers to and
ends with the last character within that source construct. For a
declaration, the extent covers the declaration itself. For a reference,
the extent covers the location of the reference (e.g., where the referenced
entity was actually used).
"""
function clang_getCursorExtent(arg1)
    ccall((:clang_getCursorExtent, libclang), CXSourceRange, (CXCursor,), arg1)
end

"""
    clang_getCursorType(C)

Retrieve the type of a CXCursor (if any).
"""
function clang_getCursorType(C)
    ccall((:clang_getCursorType, libclang), CXType, (CXCursor,), C)
end

"""
    clang_getTypeSpelling(CT)

Pretty-print the underlying type using the rules of the
language of the translation unit from which it came.

If the type is invalid, an empty string is returned.
"""
function clang_getTypeSpelling(CT)
    ccall((:clang_getTypeSpelling, libclang), CXString, (CXType,), CT)
end

"""
    clang_getTypedefDeclUnderlyingType(C)

Retrieve the underlying type of a typedef declaration.

If the cursor does not reference a typedef declaration, an invalid type is
returned.
"""
function clang_getTypedefDeclUnderlyingType(C)
    ccall((:clang_getTypedefDeclUnderlyingType, libclang), CXType, (CXCursor,), C)
end

"""
    clang_getEnumDeclIntegerType(C)

Retrieve the integer type of an enum declaration.

If the cursor does not reference an enum declaration, an invalid type is
returned.
"""
function clang_getEnumDeclIntegerType(C)
    ccall((:clang_getEnumDeclIntegerType, libclang), CXType, (CXCursor,), C)
end

"""
    clang_getEnumConstantDeclValue(C)

Retrieve the integer value of an enum constant declaration as a signed
 long long.

If the cursor does not reference an enum constant declaration, LLONG_MIN is returned.
Since this is also potentially a valid constant value, the kind of the cursor
must be verified before calling this function.
"""
function clang_getEnumConstantDeclValue(C)
    ccall((:clang_getEnumConstantDeclValue, libclang), Clonglong, (CXCursor,), C)
end

"""
    clang_getEnumConstantDeclUnsignedValue(C)

Retrieve the integer value of an enum constant declaration as an unsigned
 long long.

If the cursor does not reference an enum constant declaration, ULLONG_MAX is returned.
Since this is also potentially a valid constant value, the kind of the cursor
must be verified before calling this function.
"""
function clang_getEnumConstantDeclUnsignedValue(C)
    ccall((:clang_getEnumConstantDeclUnsignedValue, libclang), Culonglong, (CXCursor,), C)
end

"""
    clang_getFieldDeclBitWidth(C)

Retrieve the bit width of a bit field declaration as an integer.

If a cursor that is not a bit field declaration is passed in, -1 is returned.
"""
function clang_getFieldDeclBitWidth(C)
    ccall((:clang_getFieldDeclBitWidth, libclang), Cint, (CXCursor,), C)
end

"""
    clang_Cursor_getNumArguments(C)

Retrieve the number of non-variadic arguments associated with a given
cursor.

The number of arguments can be determined for calls as well as for
declarations of functions or methods. For other cursors -1 is returned.
"""
function clang_Cursor_getNumArguments(C)
    ccall((:clang_Cursor_getNumArguments, libclang), Cint, (CXCursor,), C)
end

"""
    clang_Cursor_getArgument(C, i)

Retrieve the argument cursor of a function or method.

The argument cursor can be determined for calls as well as for declarations
of functions or methods. For other cursors and for invalid indices, an
invalid cursor is returned.
"""
function clang_Cursor_getArgument(C, i)
    ccall((:clang_Cursor_getArgument, libclang), CXCursor, (CXCursor, UInt32), C, i)
end

"""
    clang_Cursor_getNumTemplateArguments(C)

Returns the number of template args of a function decl representing a
template specialization.

If the argument cursor cannot be converted into a template function
declaration, -1 is returned.

For example, for the following declaration and specialization:
  template <typename T, int kInt, bool kBool>
  void foo() { ... }

  template <>
  void foo<float, -7, true>();

The value 3 would be returned from this call.
"""
function clang_Cursor_getNumTemplateArguments(C)
    ccall((:clang_Cursor_getNumTemplateArguments, libclang), Cint, (CXCursor,), C)
end

"""
    clang_Cursor_getTemplateArgumentKind(C, I)

Retrieve the kind of the I'th template argument of the CXCursor C.

If the argument CXCursor does not represent a FunctionDecl, an invalid
template argument kind is returned.

For example, for the following declaration and specialization:
  template <typename T, int kInt, bool kBool>
  void foo() { ... }

  template <>
  void foo<float, -7, true>();

For I = 0, 1, and 2, Type, Integral, and Integral will be returned,
respectively.
"""
function clang_Cursor_getTemplateArgumentKind(C, I)
    ccall((:clang_Cursor_getTemplateArgumentKind, libclang), CXTemplateArgumentKind, (CXCursor, UInt32), C, I)
end

"""
    clang_Cursor_getTemplateArgumentType(C, I)

Retrieve a CXType representing the type of a TemplateArgument of a
 function decl representing a template specialization.

If the argument CXCursor does not represent a FunctionDecl whose I'th
template argument has a kind of CXTemplateArgKind_Integral, an invalid type
is returned.

For example, for the following declaration and specialization:
  template <typename T, int kInt, bool kBool>
  void foo() { ... }

  template <>
  void foo<float, -7, true>();

If called with I = 0, \"float\", will be returned.
Invalid types will be returned for I == 1 or 2.
"""
function clang_Cursor_getTemplateArgumentType(C, I)
    ccall((:clang_Cursor_getTemplateArgumentType, libclang), CXType, (CXCursor, UInt32), C, I)
end

"""
    clang_Cursor_getTemplateArgumentValue(C, I)

Retrieve the value of an Integral TemplateArgument (of a function
 decl representing a template specialization) as a signed long long.

It is undefined to call this function on a CXCursor that does not represent a
FunctionDecl or whose I'th template argument is not an integral value.

For example, for the following declaration and specialization:
  template <typename T, int kInt, bool kBool>
  void foo() { ... }

  template <>
  void foo<float, -7, true>();

If called with I = 1 or 2, -7 or true will be returned, respectively.
For I == 0, this function's behavior is undefined.
"""
function clang_Cursor_getTemplateArgumentValue(C, I)
    ccall((:clang_Cursor_getTemplateArgumentValue, libclang), Clonglong, (CXCursor, UInt32), C, I)
end

"""
    clang_Cursor_getTemplateArgumentUnsignedValue(C, I)

Retrieve the value of an Integral TemplateArgument (of a function
 decl representing a template specialization) as an unsigned long long.

It is undefined to call this function on a CXCursor that does not represent a
FunctionDecl or whose I'th template argument is not an integral value.

For example, for the following declaration and specialization:
  template <typename T, int kInt, bool kBool>
  void foo() { ... }

  template <>
  void foo<float, 2147483649, true>();

If called with I = 1 or 2, 2147483649 or true will be returned, respectively.
For I == 0, this function's behavior is undefined.
"""
function clang_Cursor_getTemplateArgumentUnsignedValue(C, I)
    ccall((:clang_Cursor_getTemplateArgumentUnsignedValue, libclang), Culonglong, (CXCursor, UInt32), C, I)
end

"""
    clang_equalTypes(A, B)

Determine whether two CXTypes represent the same type.

# Return
- non-zero if the CXTypes represent the same type and
         zero otherwise.
"""
function clang_equalTypes(A, B)
    ccall((:clang_equalTypes, libclang), UInt32, (CXType, CXType), A, B)
end

"""
    clang_getCanonicalType(T)

Return the canonical type for a CXType.

Clang's type system explicitly models typedefs and all the ways
a specific type can be represented.  The canonical type is the underlying
type with all the \"sugar\" removed.  For example, if 'T' is a typedef
for 'int', the canonical type for 'T' would be 'int'.
"""
function clang_getCanonicalType(T)
    ccall((:clang_getCanonicalType, libclang), CXType, (CXType,), T)
end

"""
    clang_isConstQualifiedType(T)

Determine whether a CXType has the \"const\" qualifier set,
without looking through typedefs that may have added \"const\" at a
different level.
"""
function clang_isConstQualifiedType(T)
    ccall((:clang_isConstQualifiedType, libclang), UInt32, (CXType,), T)
end

"""
    clang_Cursor_isMacroFunctionLike(C)

Determine whether a  CXCursor that is a macro, is
function like.
"""
function clang_Cursor_isMacroFunctionLike(C)
    ccall((:clang_Cursor_isMacroFunctionLike, libclang), UInt32, (CXCursor,), C)
end

"""
    clang_Cursor_isMacroBuiltin(C)

Determine whether a  CXCursor that is a macro, is a
builtin one.
"""
function clang_Cursor_isMacroBuiltin(C)
    ccall((:clang_Cursor_isMacroBuiltin, libclang), UInt32, (CXCursor,), C)
end

"""
    clang_Cursor_isFunctionInlined(C)

Determine whether a  CXCursor that is a function declaration, is an
inline declaration.
"""
function clang_Cursor_isFunctionInlined(C)
    ccall((:clang_Cursor_isFunctionInlined, libclang), UInt32, (CXCursor,), C)
end

"""
    clang_isVolatileQualifiedType(T)

Determine whether a CXType has the \"volatile\" qualifier set,
without looking through typedefs that may have added \"volatile\" at
a different level.
"""
function clang_isVolatileQualifiedType(T)
    ccall((:clang_isVolatileQualifiedType, libclang), UInt32, (CXType,), T)
end

"""
    clang_isRestrictQualifiedType(T)

Determine whether a CXType has the \"restrict\" qualifier set,
without looking through typedefs that may have added \"restrict\" at a
different level.
"""
function clang_isRestrictQualifiedType(T)
    ccall((:clang_isRestrictQualifiedType, libclang), UInt32, (CXType,), T)
end

"""
    clang_getAddressSpace(T)

Returns the address space of the given type.
"""
function clang_getAddressSpace(T)
    ccall((:clang_getAddressSpace, libclang), UInt32, (CXType,), T)
end

"""
    clang_getTypedefName(CT)

Returns the typedef name of the given type.
"""
function clang_getTypedefName(CT)
    ccall((:clang_getTypedefName, libclang), CXString, (CXType,), CT)
end

"""
    clang_getPointeeType(T)

For pointer types, returns the type of the pointee.
"""
function clang_getPointeeType(T)
    ccall((:clang_getPointeeType, libclang), CXType, (CXType,), T)
end

"""
    clang_getTypeDeclaration(T)

Return the cursor for the declaration of the given type.
"""
function clang_getTypeDeclaration(T)
    ccall((:clang_getTypeDeclaration, libclang), CXCursor, (CXType,), T)
end

"""
    clang_getDeclObjCTypeEncoding(C)

Returns the Objective-C type encoding for the specified declaration.
"""
function clang_getDeclObjCTypeEncoding(C)
    ccall((:clang_getDeclObjCTypeEncoding, libclang), CXString, (CXCursor,), C)
end

"""
    clang_Type_getObjCEncoding(type)

Returns the Objective-C type encoding for the specified CXType.
"""
function clang_Type_getObjCEncoding(type)
    ccall((:clang_Type_getObjCEncoding, libclang), CXString, (CXType,), type)
end

"""
    clang_getTypeKindSpelling(K)

Retrieve the spelling of a given CXTypeKind.
"""
function clang_getTypeKindSpelling(K)
    ccall((:clang_getTypeKindSpelling, libclang), CXString, (CXTypeKind,), K)
end

"""
    clang_getFunctionTypeCallingConv(T)

Retrieve the calling convention associated with a function type.

If a non-function type is passed in, CXCallingConv_Invalid is returned.
"""
function clang_getFunctionTypeCallingConv(T)
    ccall((:clang_getFunctionTypeCallingConv, libclang), CXCallingConv, (CXType,), T)
end

"""
    clang_getResultType(T)

Retrieve the return type associated with a function type.

If a non-function type is passed in, an invalid type is returned.
"""
function clang_getResultType(T)
    ccall((:clang_getResultType, libclang), CXType, (CXType,), T)
end

"""
    clang_getExceptionSpecificationType(T)

Retrieve the exception specification type associated with a function type.

If a non-function type is passed in, an error code of -1 is returned.
"""
function clang_getExceptionSpecificationType(T)
    ccall((:clang_getExceptionSpecificationType, libclang), Cint, (CXType,), T)
end

"""
    clang_getNumArgTypes(T)

Retrieve the number of non-variadic parameters associated with a
function type.

If a non-function type is passed in, -1 is returned.
"""
function clang_getNumArgTypes(T)
    ccall((:clang_getNumArgTypes, libclang), Cint, (CXType,), T)
end

"""
    clang_getArgType(T, i)

Retrieve the type of a parameter of a function type.

If a non-function type is passed in or the function does not have enough
parameters, an invalid type is returned.
"""
function clang_getArgType(T, i)
    ccall((:clang_getArgType, libclang), CXType, (CXType, UInt32), T, i)
end

"""
    clang_isFunctionTypeVariadic(T)

Return 1 if the CXType is a variadic function type, and 0 otherwise.
"""
function clang_isFunctionTypeVariadic(T)
    ccall((:clang_isFunctionTypeVariadic, libclang), UInt32, (CXType,), T)
end

"""
    clang_getCursorResultType(C)

Retrieve the return type associated with a given cursor.

This only returns a valid type if the cursor refers to a function or method.
"""
function clang_getCursorResultType(C)
    ccall((:clang_getCursorResultType, libclang), CXType, (CXCursor,), C)
end

"""
    clang_getCursorExceptionSpecificationType(C)

Retrieve the exception specification type associated with a given cursor.

This only returns a valid result if the cursor refers to a function or method.
"""
function clang_getCursorExceptionSpecificationType(C)
    ccall((:clang_getCursorExceptionSpecificationType, libclang), Cint, (CXCursor,), C)
end

"""
    clang_isPODType(T)

Return 1 if the CXType is a POD (plain old data) type, and 0
 otherwise.
"""
function clang_isPODType(T)
    ccall((:clang_isPODType, libclang), UInt32, (CXType,), T)
end

"""
    clang_getElementType(T)

Return the element type of an array, complex, or vector type.

If a type is passed in that is not an array, complex, or vector type,
an invalid type is returned.
"""
function clang_getElementType(T)
    ccall((:clang_getElementType, libclang), CXType, (CXType,), T)
end

"""
    clang_getNumElements(T)

Return the number of elements of an array or vector type.

If a type is passed in that is not an array or vector type,
-1 is returned.
"""
function clang_getNumElements(T)
    ccall((:clang_getNumElements, libclang), Clonglong, (CXType,), T)
end

"""
    clang_getArrayElementType(T)

Return the element type of an array type.

If a non-array type is passed in, an invalid type is returned.
"""
function clang_getArrayElementType(T)
    ccall((:clang_getArrayElementType, libclang), CXType, (CXType,), T)
end

"""
    clang_getArraySize(T)

Return the array size of a constant array.

If a non-array type is passed in, -1 is returned.
"""
function clang_getArraySize(T)
    ccall((:clang_getArraySize, libclang), Clonglong, (CXType,), T)
end

"""
    clang_Type_getNamedType(T)

Retrieve the type named by the qualified-id.

If a non-elaborated type is passed in, an invalid type is returned.
"""
function clang_Type_getNamedType(T)
    ccall((:clang_Type_getNamedType, libclang), CXType, (CXType,), T)
end

"""
    clang_Type_isTransparentTagTypedef(T)

Determine if a typedef is 'transparent' tag.

A typedef is considered 'transparent' if it shares a name and spelling
location with its underlying tag type, as is the case with the NS_ENUM macro.

# Return
- non-zero if transparent and zero otherwise.
"""
function clang_Type_isTransparentTagTypedef(T)
    ccall((:clang_Type_isTransparentTagTypedef, libclang), UInt32, (CXType,), T)
end

"""
    clang_Type_getAlignOf(T)

Return the alignment of a type in bytes as per C++[expr.alignof]
  standard.

If the type declaration is invalid, CXTypeLayoutError_Invalid is returned.
If the type declaration is an incomplete type, CXTypeLayoutError_Incomplete
  is returned.
If the type declaration is a dependent type, CXTypeLayoutError_Dependent is
  returned.
If the type declaration is not a constant size type,
  CXTypeLayoutError_NotConstantSize is returned.
"""
function clang_Type_getAlignOf(T)
    ccall((:clang_Type_getAlignOf, libclang), Clonglong, (CXType,), T)
end

"""
    clang_Type_getClassType(T)

Return the class type of an member pointer type.

If a non-member-pointer type is passed in, an invalid type is returned.
"""
function clang_Type_getClassType(T)
    ccall((:clang_Type_getClassType, libclang), CXType, (CXType,), T)
end

"""
    clang_Type_getSizeOf(T)

Return the size of a type in bytes as per C++[expr.sizeof] standard.

If the type declaration is invalid, CXTypeLayoutError_Invalid is returned.
If the type declaration is an incomplete type, CXTypeLayoutError_Incomplete
  is returned.
If the type declaration is a dependent type, CXTypeLayoutError_Dependent is
  returned.
"""
function clang_Type_getSizeOf(T)
    ccall((:clang_Type_getSizeOf, libclang), Clonglong, (CXType,), T)
end

"""
    clang_Type_getOffsetOf(T, S)

Return the offset of a field named S in a record of type T in bits
  as it would be returned by __offsetof__ as per C++11[18.2p4]

If the cursor is not a record field declaration, CXTypeLayoutError_Invalid
  is returned.
If the field's type declaration is an incomplete type,
  CXTypeLayoutError_Incomplete is returned.
If the field's type declaration is a dependent type,
  CXTypeLayoutError_Dependent is returned.
If the field's name S is not found,
  CXTypeLayoutError_InvalidFieldName is returned.
"""
function clang_Type_getOffsetOf(T, S)
    ccall((:clang_Type_getOffsetOf, libclang), Clonglong, (CXType, Cstring), T, S)
end

"""
    clang_Cursor_getOffsetOfField(C)

Return the offset of the field represented by the Cursor.

If the cursor is not a field declaration, -1 is returned.
If the cursor semantic parent is not a record field declaration,
  CXTypeLayoutError_Invalid is returned.
If the field's type declaration is an incomplete type,
  CXTypeLayoutError_Incomplete is returned.
If the field's type declaration is a dependent type,
  CXTypeLayoutError_Dependent is returned.
If the field's name S is not found,
  CXTypeLayoutError_InvalidFieldName is returned.
"""
function clang_Cursor_getOffsetOfField(C)
    ccall((:clang_Cursor_getOffsetOfField, libclang), Clonglong, (CXCursor,), C)
end

"""
    clang_Cursor_isAnonymous(C)

Determine whether the given cursor represents an anonymous record
declaration.
"""
function clang_Cursor_isAnonymous(C)
    ccall((:clang_Cursor_isAnonymous, libclang), UInt32, (CXCursor,), C)
end

"""
    clang_Type_getNumTemplateArguments(T)

Returns the number of template arguments for given template
specialization, or -1 if type `T` is not a template specialization.
"""
function clang_Type_getNumTemplateArguments(T)
    ccall((:clang_Type_getNumTemplateArguments, libclang), Cint, (CXType,), T)
end

"""
    clang_Type_getTemplateArgumentAsType(T, i)

Returns the type template argument of a template class specialization
at given index.

This function only returns template type arguments and does not handle
template template arguments or variadic packs.
"""
function clang_Type_getTemplateArgumentAsType(T, i)
    ccall((:clang_Type_getTemplateArgumentAsType, libclang), CXType, (CXType, UInt32), T, i)
end

"""
    clang_Type_getCXXRefQualifier(T)

Retrieve the ref-qualifier kind of a function or method.

The ref-qualifier is returned for C++ functions or methods. For other types
or non-C++ declarations, CXRefQualifier_None is returned.
"""
function clang_Type_getCXXRefQualifier(T)
    ccall((:clang_Type_getCXXRefQualifier, libclang), CXRefQualifierKind, (CXType,), T)
end

"""
    clang_Cursor_isBitField(C)

Returns non-zero if the cursor specifies a Record member that is a
  bitfield.
"""
function clang_Cursor_isBitField(C)
    ccall((:clang_Cursor_isBitField, libclang), UInt32, (CXCursor,), C)
end

"""
    clang_isVirtualBase(arg1)

Returns 1 if the base class specified by the cursor with kind
  CX_CXXBaseSpecifier is virtual.
"""
function clang_isVirtualBase(arg1)
    ccall((:clang_isVirtualBase, libclang), UInt32, (CXCursor,), arg1)
end

"""
    clang_getCXXAccessSpecifier(arg1)

Returns the access control level for the referenced object.

If the cursor refers to a C++ declaration, its access control level within its
parent scope is returned. Otherwise, if the cursor refers to a base specifier or
access specifier, the specifier itself is returned.
"""
function clang_getCXXAccessSpecifier(arg1)
    ccall((:clang_getCXXAccessSpecifier, libclang), CX_CXXAccessSpecifier, (CXCursor,), arg1)
end

"""
    clang_Cursor_getStorageClass(arg1)

Returns the storage class for a function or variable declaration.

If the passed in Cursor is not a function or variable declaration,
CX_SC_Invalid is returned else the storage class.
"""
function clang_Cursor_getStorageClass(arg1)
    ccall((:clang_Cursor_getStorageClass, libclang), CX_StorageClass, (CXCursor,), arg1)
end

"""
    clang_getNumOverloadedDecls(cursor)

Determine the number of overloaded declarations referenced by a 
`CXCursor_OverloadedDeclRef` cursor.

# Arguments
- `cursor`: The cursor whose overloaded declarations are being queried.

# Return
- The number of overloaded declarations referenced by `cursor.` If it
is not a `CXCursor_OverloadedDeclRef` cursor, returns 0.
"""
function clang_getNumOverloadedDecls(cursor)
    ccall((:clang_getNumOverloadedDecls, libclang), UInt32, (CXCursor,), cursor)
end

"""
    clang_getOverloadedDecl(cursor, index)

Retrieve a cursor for one of the overloaded declarations referenced
by a `CXCursor_OverloadedDeclRef` cursor.

# Arguments
- `cursor`: The cursor whose overloaded declarations are being queried.

- `index`: The zero-based index into the set of overloaded declarations in
the cursor.

# Return
- A cursor representing the declaration referenced by the given 
`cursor` at the specified `index.` If the cursor does not have an 
associated set of overloaded declarations, or if the index is out of bounds,
returns `clang_getNullCursor(` ;
"""
function clang_getOverloadedDecl(cursor, index)
    ccall((:clang_getOverloadedDecl, libclang), CXCursor, (CXCursor, UInt32), cursor, index)
end

"""
    clang_getIBOutletCollectionType(arg1)

For cursors representing an iboutletcollection attribute,
 this function returns the collection element type.

"""
function clang_getIBOutletCollectionType(arg1)
    ccall((:clang_getIBOutletCollectionType, libclang), CXType, (CXCursor,), arg1)
end

"""
    clang_visitChildren(parent, visitor, client_data)

Visit the children of a particular cursor.

This function visits all the direct children of the given cursor,
invoking the given \\p visitor function with the cursors of each
visited child. The traversal may be recursive, if the visitor returns
`CXChildVisit_Recurse.` The traversal may also be ended prematurely, if
the visitor returns `CXChildVisit_Break` 

# Arguments
- `parent`: the cursor whose child may be visited. All kinds of
cursors can be visited, including invalid cursors (which, by
definition, have no children).

- `visitor`: the visitor function that will be invoked for each
child of \\p parent.

- `client_data`: pointer data supplied by the client, which will
be passed to the visitor each time it is invoked.

# Return
- a non-zero value if the traversal was terminated
prematurely by the visitor returning `CXChildVisit_Break` 
"""
function clang_visitChildren(parent, visitor, client_data)
    ccall((:clang_visitChildren, libclang), UInt32, (CXCursor, CXCursorVisitor, CXClientData), parent, visitor, client_data)
end

"""
    clang_getCursorUSR(arg1)

Retrieve a Unified Symbol Resolution (USR) for the entity referenced
by the given cursor.

A Unified Symbol Resolution (USR) is a string that identifies a particular
entity (function, class, variable, etc.) within a program. USRs can be
compared across translation units to determine, e.g., when references in
one translation refer to an entity defined in another translation unit.
"""
function clang_getCursorUSR(arg1)
    ccall((:clang_getCursorUSR, libclang), CXString, (CXCursor,), arg1)
end

"""
    clang_constructUSR_ObjCClass(class_name)

Construct a USR for a specified Objective-C class.
"""
function clang_constructUSR_ObjCClass(class_name)
    ccall((:clang_constructUSR_ObjCClass, libclang), CXString, (Cstring,), class_name)
end

"""
    clang_constructUSR_ObjCCategory(class_name, category_name)

Construct a USR for a specified Objective-C category.
"""
function clang_constructUSR_ObjCCategory(class_name, category_name)
    ccall((:clang_constructUSR_ObjCCategory, libclang), CXString, (Cstring, Cstring), class_name, category_name)
end

"""
    clang_constructUSR_ObjCProtocol(protocol_name)

Construct a USR for a specified Objective-C protocol.
"""
function clang_constructUSR_ObjCProtocol(protocol_name)
    ccall((:clang_constructUSR_ObjCProtocol, libclang), CXString, (Cstring,), protocol_name)
end

"""
    clang_constructUSR_ObjCIvar(name, classUSR)

Construct a USR for a specified Objective-C instance variable and
  the USR for its containing class.
"""
function clang_constructUSR_ObjCIvar(name, classUSR)
    ccall((:clang_constructUSR_ObjCIvar, libclang), CXString, (Cstring, CXString), name, classUSR)
end

"""
    clang_constructUSR_ObjCMethod(name, isInstanceMethod, classUSR)

Construct a USR for a specified Objective-C method and
  the USR for its containing class.
"""
function clang_constructUSR_ObjCMethod(name, isInstanceMethod, classUSR)
    ccall((:clang_constructUSR_ObjCMethod, libclang), CXString, (Cstring, UInt32, CXString), name, isInstanceMethod, classUSR)
end

"""
    clang_constructUSR_ObjCProperty(property, classUSR)

Construct a USR for a specified Objective-C property and the USR
 for its containing class.
"""
function clang_constructUSR_ObjCProperty(property, classUSR)
    ccall((:clang_constructUSR_ObjCProperty, libclang), CXString, (Cstring, CXString), property, classUSR)
end

"""
    clang_getCursorSpelling(arg1)

Retrieve a name for the entity referenced by this cursor.
"""
function clang_getCursorSpelling(arg1)
    ccall((:clang_getCursorSpelling, libclang), CXString, (CXCursor,), arg1)
end

"""
    clang_Cursor_getSpellingNameRange(arg1, pieceIndex, options)

Retrieve a range for a piece that forms the cursors spelling name.
Most of the times there is only one range for the complete spelling but for
Objective-C methods and Objective-C message expressions, there are multiple
pieces for each selector identifier.

# Arguments
- `pieceIndex`: the index of the spelling name piece. If this is greater
than the actual number of pieces, it will return a NULL (invalid) range.
 
- `options`: Reserved.
"""
function clang_Cursor_getSpellingNameRange(arg1, pieceIndex, options)
    ccall((:clang_Cursor_getSpellingNameRange, libclang), CXSourceRange, (CXCursor, UInt32, UInt32), arg1, pieceIndex, options)
end

"""
    clang_getCursorDisplayName(arg1)

Retrieve the display name for the entity referenced by this cursor.

The display name contains extra information that helps identify the cursor,
such as the parameters of a function or template or the arguments of a 
class template specialization.
"""
function clang_getCursorDisplayName(arg1)
    ccall((:clang_getCursorDisplayName, libclang), CXString, (CXCursor,), arg1)
end

"""
    clang_getCursorReferenced(arg1)
 For a cursor that is a reference, retrieve a cursor representing the
entity that it references.

Reference cursors refer to other entities in the AST. For example, an
Objective-C superclass reference cursor refers to an Objective-C class.
This function produces the cursor for the Objective-C class from the
cursor for the superclass reference. If the input cursor is a declaration or
definition, it returns that declaration or definition unchanged.
Otherwise, returns the NULL cursor.
"""
function clang_getCursorReferenced(arg1)
    ccall((:clang_getCursorReferenced, libclang), CXCursor, (CXCursor,), arg1)
end

"""
    clang_getCursorDefinition(arg1)

 For a cursor that is either a reference to or a declaration
 of some entity, retrieve a cursor that describes the definition of
 that entity.

 Some entities can be declared multiple times within a translation
 unit, but only one of those declarations can also be a
 definition. For example, given:

 \\code
 int f(int, int);
 int g(int x, int y) { return f(x, y); }
 int f(int a, int b) { return a + b; }
 int f(int, int);
 \\endcode

 there are three declarations of the function \"f\", but only the
 second one is a definition. The clang_getCursorDefinition()
 function will take any cursor pointing to a declaration of \"f\"
 (the first or fourth lines of the example) or a cursor referenced
 that uses \"f\" (the call to \"f' inside \"g\") and will return a
 declaration cursor pointing to the definition (the second \"f\"
 declaration).

 If given a cursor for which there is no corresponding definition,
 e.g., because there is no definition of that entity within this
 translation unit, returns a NULL cursor.
"""
function clang_getCursorDefinition(arg1)
    ccall((:clang_getCursorDefinition, libclang), CXCursor, (CXCursor,), arg1)
end

"""
    clang_isCursorDefinition(arg1)

Determine whether the declaration pointed to by this cursor
is also a definition of that entity.
"""
function clang_isCursorDefinition(arg1)
    ccall((:clang_isCursorDefinition, libclang), UInt32, (CXCursor,), arg1)
end

"""
    clang_getCanonicalCursor(arg1)
\x10\xa7\xfb 
"""
function clang_getCanonicalCursor(arg1)
    ccall((:clang_getCanonicalCursor, libclang), CXCursor, (CXCursor,), arg1)
end

"""
    clang_Cursor_getObjCSelectorIndex(arg1)

If the cursor points to a selector identifier in an Objective-C
method or message expression, this returns the selector index.

After getting a cursor with #clang_getCursor, this can be called to
determine if the location points to a selector identifier.

# Return
- The selector index if the cursor is an Objective-C method or message
expression and the cursor is pointing to a selector identifier, or -1
otherwise.
"""
function clang_Cursor_getObjCSelectorIndex(arg1)
    ccall((:clang_Cursor_getObjCSelectorIndex, libclang), Cint, (CXCursor,), arg1)
end

"""
    clang_Cursor_isDynamicCall(C)

Given a cursor pointing to a C++ method call or an Objective-C
message, returns non-zero if the method/message is \"dynamic\", meaning:

For a C++ method: the call is virtual.
For an Objective-C message: the receiver is an object instance, not 'super'
or a specific class.

If the method/message is \"static\" or the cursor does not point to a
method/message, it will return zero.
"""
function clang_Cursor_isDynamicCall(C)
    ccall((:clang_Cursor_isDynamicCall, libclang), Cint, (CXCursor,), C)
end

"""
    clang_Cursor_getReceiverType(C)

Given a cursor pointing to an Objective-C message or property
reference, or C++ method call, returns the CXType of the receiver.
"""
function clang_Cursor_getReceiverType(C)
    ccall((:clang_Cursor_getReceiverType, libclang), CXType, (CXCursor,), C)
end

"""
    clang_Cursor_getObjCPropertyAttributes(C, reserved)

Given a cursor that represents a property declaration, return the
associated property attributes. The bits are formed from
`CXObjCPropertyAttrKind` 

# Arguments
- `reserved`: Reserved for future use, pass 0.
"""
function clang_Cursor_getObjCPropertyAttributes(C, reserved)
    ccall((:clang_Cursor_getObjCPropertyAttributes, libclang), UInt32, (CXCursor, UInt32), C, reserved)
end

"""
    clang_Cursor_getObjCDeclQualifiers(C)

Given a cursor that represents an Objective-C method or parameter
declaration, return the associated Objective-C qualifiers for the return
type or the parameter respectively. The bits are formed from
CXObjCDeclQualifierKind.
"""
function clang_Cursor_getObjCDeclQualifiers(C)
    ccall((:clang_Cursor_getObjCDeclQualifiers, libclang), UInt32, (CXCursor,), C)
end

"""
    clang_Cursor_isObjCOptional(C)

Given a cursor that represents an Objective-C method or property
declaration, return non-zero if the declaration was affected by \"\\@optional\".
Returns zero if the cursor is not such a declaration or it is \"\\@required\".
"""
function clang_Cursor_isObjCOptional(C)
    ccall((:clang_Cursor_isObjCOptional, libclang), UInt32, (CXCursor,), C)
end

"""
    clang_Cursor_isVariadic(C)

Returns non-zero if the given cursor is a variadic function or method.
"""
function clang_Cursor_isVariadic(C)
    ccall((:clang_Cursor_isVariadic, libclang), UInt32, (CXCursor,), C)
end

"""
    clang_Cursor_isExternalSymbol(C, language, definedIn, isGenerated)

Returns non-zero if the given cursor points to a symbol marked with
external_source_symbol attribute.

# Arguments
- `language`: If non-NULL, and the attribute is present, will be set to
the 'language' string from the attribute.

- `definedIn`: If non-NULL, and the attribute is present, will be set to
the 'definedIn' string from the attribute.

- `isGenerated`: If non-NULL, and the attribute is present, will be set to
non-zero if the 'generated_declaration' is set in the attribute.
"""
function clang_Cursor_isExternalSymbol(C, language, definedIn, isGenerated)
    ccall((:clang_Cursor_isExternalSymbol, libclang), UInt32, (CXCursor, Ptr{CXString}, Ptr{CXString}, Ptr{UInt32}), C, language, definedIn, isGenerated)
end

"""
    clang_Cursor_getCommentRange(C)

Given a cursor that represents a declaration, return the associated
comment's source range.  The range may include multiple consecutive comments
with whitespace in between.
"""
function clang_Cursor_getCommentRange(C)
    ccall((:clang_Cursor_getCommentRange, libclang), CXSourceRange, (CXCursor,), C)
end

"""
    clang_Cursor_getRawCommentText(C)

Given a cursor that represents a declaration, return the associated
comment text, including comment markers.
"""
function clang_Cursor_getRawCommentText(C)
    ccall((:clang_Cursor_getRawCommentText, libclang), CXString, (CXCursor,), C)
end

"""
    clang_Cursor_getBriefCommentText(C)

Given a cursor that represents a documentable entity (e.g.,
declaration), return the associated \\paragraph; otherwise return the
first paragraph.
"""
function clang_Cursor_getBriefCommentText(C)
    ccall((:clang_Cursor_getBriefCommentText, libclang), CXString, (CXCursor,), C)
end

"""
    clang_Cursor_getMangling(arg1)

Retrieve the CXString representing the mangled name of the cursor.
"""
function clang_Cursor_getMangling(arg1)
    ccall((:clang_Cursor_getMangling, libclang), CXString, (CXCursor,), arg1)
end

"""
    clang_Cursor_getCXXManglings(arg1)

Retrieve the CXStrings representing the mangled symbols of the C++
constructor or destructor at the cursor.
"""
function clang_Cursor_getCXXManglings(arg1)
    ccall((:clang_Cursor_getCXXManglings, libclang), Ptr{CXStringSet}, (CXCursor,), arg1)
end

"""
    clang_Cursor_getObjCManglings(arg1)

Retrieve the CXStrings representing the mangled symbols of the ObjC
class interface or implementation at the cursor.
"""
function clang_Cursor_getObjCManglings(arg1)
    ccall((:clang_Cursor_getObjCManglings, libclang), Ptr{CXStringSet}, (CXCursor,), arg1)
end

"""
    clang_Cursor_getModule(C)

Given a CXCursor_ModuleImportDecl cursor, return the associated module.
"""
function clang_Cursor_getModule(C)
    ccall((:clang_Cursor_getModule, libclang), CXModule, (CXCursor,), C)
end

"""
    clang_getModuleForFile(arg1, arg2)

Given a CXFile header file, return the module that contains it, if one
exists.
"""
function clang_getModuleForFile(arg1, arg2)
    ccall((:clang_getModuleForFile, libclang), CXModule, (CXTranslationUnit, CXFile), arg1, arg2)
end

"""
    clang_Module_getASTFile(Module)

# Arguments
- `Module`: a module object.

# Return
- the module file where the provided module object came from.
"""
function clang_Module_getASTFile(Module)
    ccall((:clang_Module_getASTFile, libclang), CXFile, (CXModule,), Module)
end

"""
    clang_Module_getParent(Module)

# Arguments
- `Module`: a module object.

# Return
- the parent of a sub-module or NULL if the given module is top-level,
e.g. for 'std.vector' it will return the 'std' module.
"""
function clang_Module_getParent(Module)
    ccall((:clang_Module_getParent, libclang), CXModule, (CXModule,), Module)
end

"""
    clang_Module_getName(Module)

# Arguments
- `Module`: a module object.

# Return
- the name of the module, e.g. for the 'std.vector' sub-module it
will return \"vector\".
"""
function clang_Module_getName(Module)
    ccall((:clang_Module_getName, libclang), CXString, (CXModule,), Module)
end

"""
    clang_Module_getFullName(Module)

# Arguments
- `Module`: a module object.

# Return
- the full name of the module, e.g. \"std.vector\".
"""
function clang_Module_getFullName(Module)
    ccall((:clang_Module_getFullName, libclang), CXString, (CXModule,), Module)
end

"""
    clang_Module_isSystem(Module)

# Arguments
- `Module`: a module object.

# Return
- non-zero if the module is a system one.
"""
function clang_Module_isSystem(Module)
    ccall((:clang_Module_isSystem, libclang), Cint, (CXModule,), Module)
end

"""
    clang_Module_getNumTopLevelHeaders(arg1, Module)

# Arguments
- `Module`: a module object.

# Return
- the number of top level headers associated with this module.
"""
function clang_Module_getNumTopLevelHeaders(arg1, Module)
    ccall((:clang_Module_getNumTopLevelHeaders, libclang), UInt32, (CXTranslationUnit, CXModule), arg1, Module)
end

"""
    clang_Module_getTopLevelHeader(arg1, Module, Index)

# Arguments
- `Module`: a module object.

# Arguments
- `Index`: top level header index (zero-based).

# Return
- the specified top level header associated with the module.
"""
function clang_Module_getTopLevelHeader(arg1, Module, Index)
    ccall((:clang_Module_getTopLevelHeader, libclang), CXFile, (CXTranslationUnit, CXModule, UInt32), arg1, Module, Index)
end

"""
    clang_CXXConstructor_isConvertingConstructor(C)

Determine if a C++ constructor is a converting constructor.
"""
function clang_CXXConstructor_isConvertingConstructor(C)
    ccall((:clang_CXXConstructor_isConvertingConstructor, libclang), UInt32, (CXCursor,), C)
end

"""
    clang_CXXConstructor_isCopyConstructor(C)

Determine if a C++ constructor is a copy constructor.
"""
function clang_CXXConstructor_isCopyConstructor(C)
    ccall((:clang_CXXConstructor_isCopyConstructor, libclang), UInt32, (CXCursor,), C)
end

"""
    clang_CXXConstructor_isDefaultConstructor(C)

Determine if a C++ constructor is the default constructor.
"""
function clang_CXXConstructor_isDefaultConstructor(C)
    ccall((:clang_CXXConstructor_isDefaultConstructor, libclang), UInt32, (CXCursor,), C)
end

"""
    clang_CXXConstructor_isMoveConstructor(C)

Determine if a C++ constructor is a move constructor.
"""
function clang_CXXConstructor_isMoveConstructor(C)
    ccall((:clang_CXXConstructor_isMoveConstructor, libclang), UInt32, (CXCursor,), C)
end

"""
    clang_CXXField_isMutable(C)

Determine if a C++ field is declared 'mutable'.
"""
function clang_CXXField_isMutable(C)
    ccall((:clang_CXXField_isMutable, libclang), UInt32, (CXCursor,), C)
end

"""
    clang_CXXMethod_isDefaulted(C)

Determine if a C++ method is declared '= default'.
"""
function clang_CXXMethod_isDefaulted(C)
    ccall((:clang_CXXMethod_isDefaulted, libclang), UInt32, (CXCursor,), C)
end

"""
    clang_CXXMethod_isPureVirtual(C)

Determine if a C++ member function or member function template is
pure virtual.
"""
function clang_CXXMethod_isPureVirtual(C)
    ccall((:clang_CXXMethod_isPureVirtual, libclang), UInt32, (CXCursor,), C)
end

"""
    clang_CXXMethod_isStatic(C)

Determine if a C++ member function or member function template is 
declared 'static'.
"""
function clang_CXXMethod_isStatic(C)
    ccall((:clang_CXXMethod_isStatic, libclang), UInt32, (CXCursor,), C)
end

"""
    clang_CXXMethod_isVirtual(C)

Determine if a C++ member function or member function template is
explicitly declared 'virtual' or if it overrides a virtual method from
one of the base classes.
"""
function clang_CXXMethod_isVirtual(C)
    ccall((:clang_CXXMethod_isVirtual, libclang), UInt32, (CXCursor,), C)
end

"""
    clang_CXXRecord_isAbstract(C)

Determine if a C++ record is abstract, i.e. whether a class or struct
has a pure virtual member function.
"""
function clang_CXXRecord_isAbstract(C)
    ccall((:clang_CXXRecord_isAbstract, libclang), UInt32, (CXCursor,), C)
end

"""
    clang_EnumDecl_isScoped(C)

Determine if an enum declaration refers to a scoped enum.
"""
function clang_EnumDecl_isScoped(C)
    ccall((:clang_EnumDecl_isScoped, libclang), UInt32, (CXCursor,), C)
end

"""
    clang_CXXMethod_isConst(C)

Determine if a C++ member function or member function template is
declared 'const'.
"""
function clang_CXXMethod_isConst(C)
    ccall((:clang_CXXMethod_isConst, libclang), UInt32, (CXCursor,), C)
end

"""
    clang_getTemplateCursorKind(C)

Given a cursor that represents a template, determine
the cursor kind of the specializations would be generated by instantiating
the template.

This routine can be used to determine what flavor of function template,
class template, or class template partial specialization is stored in the
cursor. For example, it can describe whether a class template cursor is
declared with \"struct\", \"class\" or \"union\".

# Arguments
- `C`: The cursor to query. This cursor should represent a template
declaration.

# Return
- The cursor kind of the specializations that would be generated
by instantiating the template \\p C. If \\p C is not a template, returns
`CXCursor_NoDeclFound` 
"""
function clang_getTemplateCursorKind(C)
    ccall((:clang_getTemplateCursorKind, libclang), CXCursorKind, (CXCursor,), C)
end

"""
    clang_getSpecializedCursorTemplate(C)

Given a cursor that may represent a specialization or instantiation
of a template, retrieve the cursor that represents the template that it
specializes or from which it was instantiated.

This routine determines the template involved both for explicit 
specializations of templates and for implicit instantiations of the template,
both of which are referred to as \"specializations\". For a class template
specialization (e.g., `std::vector<bool>),` this routine will return 
either the primary template (`std::vector)` or, if the specialization was
instantiated from a class template partial specialization, the class template
partial specialization. For a class template partial specialization and a
function template specialization (including instantiations), this
this routine will return the specialized template.

For members of a class template (e.g., member functions, member classes, or
static data members), returns the specialized or instantiated member. 
Although not strictly \"templates\" in the C++ language, members of class
templates have the same notions of specializations and instantiations that
templates do, so this routine treats them similarly.

# Arguments
- `C`: A cursor that may be a specialization of a template or a member
of a template.

# Return
- If the given cursor is a specialization or instantiation of a 
template or a member thereof, the template or member that it specializes or
from which it was instantiated. Otherwise, returns a NULL cursor.
"""
function clang_getSpecializedCursorTemplate(C)
    ccall((:clang_getSpecializedCursorTemplate, libclang), CXCursor, (CXCursor,), C)
end

"""
    clang_getCursorReferenceNameRange(C, NameFlags, PieceIndex)

Given a cursor that references something else, return the source range
covering that reference.

# Arguments
- `C`: A cursor pointing to a member reference, a declaration reference, or
an operator call.
- `NameFlags`: A bitset with three independent flags: 
CXNameRange_WantQualifier, CXNameRange_WantTemplateArgs, and
CXNameRange_WantSinglePiece.
- `PieceIndex`: For contiguous names or when passing the flag 
CXNameRange_WantSinglePiece, only one piece with index 0 is 
available. When the CXNameRange_WantSinglePiece flag is not passed for a
non-contiguous names, this index can be used to retrieve the individual
pieces of the name. See also CXNameRange_WantSinglePiece.

# Return
- The piece of the name pointed to by the given cursor. If there is no
name, or if the PieceIndex is out-of-range, a null-cursor will be returned.
"""
function clang_getCursorReferenceNameRange(C, NameFlags, PieceIndex)
    ccall((:clang_getCursorReferenceNameRange, libclang), CXSourceRange, (CXCursor, UInt32, UInt32), C, NameFlags, PieceIndex)
end

"""
    clang_getTokenKind(arg1)

Determine the kind of the given token.
"""
function clang_getTokenKind(arg1)
    ccall((:clang_getTokenKind, libclang), CXTokenKind, (CXToken,), arg1)
end

"""
    clang_getTokenSpelling(arg1, arg2)

Determine the spelling of the given token.

The spelling of a token is the textual representation of that token, e.g.,
the text of an identifier or keyword.
"""
function clang_getTokenSpelling(arg1, arg2)
    ccall((:clang_getTokenSpelling, libclang), CXString, (CXTranslationUnit, CXToken), arg1, arg2)
end

"""
    clang_getTokenLocation(arg1, arg2)

Retrieve the source location of the given token.
"""
function clang_getTokenLocation(arg1, arg2)
    ccall((:clang_getTokenLocation, libclang), CXSourceLocation, (CXTranslationUnit, CXToken), arg1, arg2)
end

"""
    clang_getTokenExtent(arg1, arg2)

Retrieve a source range that covers the given token.
"""
function clang_getTokenExtent(arg1, arg2)
    ccall((:clang_getTokenExtent, libclang), CXSourceRange, (CXTranslationUnit, CXToken), arg1, arg2)
end

"""
    clang_tokenize(TU, Range, Tokens, NumTokens)

Tokenize the source code described by the given range into raw
lexical tokens.

# Arguments
- `TU`: the translation unit whose text is being tokenized.

- `Range`: the source range in which text should be tokenized. All of the
tokens produced by tokenization will fall within this source range,

- `Tokens`: this pointer will be set to point to the array of tokens
that occur within the given source range. The returned pointer must be
freed with clang_disposeTokens() before the translation unit is destroyed.

- `NumTokens`: will be set to the number of tokens in the \\cTokens
array.

"""
function clang_tokenize(TU, Range, Tokens, NumTokens)
    ccall((:clang_tokenize, libclang), Cvoid, (CXTranslationUnit, CXSourceRange, Ptr{Ptr{CXToken}}, Ptr{UInt32}), TU, Range, Tokens, NumTokens)
end

"""
    clang_annotateTokens(TU, Tokens, NumTokens, Cursors)

Annotate the given set of tokens by providing cursors for each token
that can be mapped to a specific entity within the abstract syntax tree.

This token-annotation routine is equivalent to invoking
clang_getCursor() for the source locations of each of the
tokens. The cursors provided are filtered, so that only those
cursors that have a direct correspondence to the token are
accepted. For example, given a function call `f(x)` 
clang_getCursor() would provide the following cursors:

 when the cursor is over the 'f', a DeclRefExpr cursor referring to 'f'.
 when the cursor is over the '(' or the ')', a CallExpr referring to 'f'.
 when the cursor is over the 'x', a DeclRefExpr cursor referring to 'x'.

Only the first and last of these cursors will occur within the
annotate, since the tokens \"f\" and \"x' directly refer to a function
and a variable, respectively, but the parentheses are just a small
part of the full syntax of the function call expression, which is
not provided as an annotation.

# Arguments
- `TU`: the translation unit that owns the given tokens.

- `Tokens`: the set of tokens to annotate.

- `NumTokens`: the number of tokens in \\p Tokens.

- `Cursors`: an array of \\p NumTokens cursors, whose contents will be
replaced with the cursors corresponding to each token.
"""
function clang_annotateTokens(TU, Tokens, NumTokens, Cursors)
    ccall((:clang_annotateTokens, libclang), Cvoid, (CXTranslationUnit, Ptr{CXToken}, UInt32, Ptr{CXCursor}), TU, Tokens, NumTokens, Cursors)
end

"""
    clang_disposeTokens(TU, Tokens, NumTokens)

Free the given set of tokens.
"""
function clang_disposeTokens(TU, Tokens, NumTokens)
    ccall((:clang_disposeTokens, libclang), Cvoid, (CXTranslationUnit, Ptr{CXToken}, UInt32), TU, Tokens, NumTokens)
end

"""
    clang_getCursorKindSpelling(Kind)

\\defgroup CINDEX_DEBUG Debugging facilities

These routines are used for testing and debugging, only, and should not
be relied upon.

@{
"""
function clang_getCursorKindSpelling(Kind)
    ccall((:clang_getCursorKindSpelling, libclang), CXString, (CXCursorKind,), Kind)
end

"""
    clang_getDefinitionSpellingAndExtent(arg1, startBuf, endBuf, startLine, startColumn, endLine, endColumn)

"""
function clang_getDefinitionSpellingAndExtent(arg1, startBuf, endBuf, startLine, startColumn, endLine, endColumn)
    ccall((:clang_getDefinitionSpellingAndExtent, libclang), Cvoid, (CXCursor, Ptr{Cstring}, Ptr{Cstring}, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}), arg1, startBuf, endBuf, startLine, startColumn, endLine, endColumn)
end

"""
    clang_enableStackTraces()

"""
function clang_enableStackTraces()
    ccall((:clang_enableStackTraces, libclang), Cvoid, ())
end

"""
    clang_executeOnThread(fn, user_data, stack_size)

"""
function clang_executeOnThread(fn, user_data, stack_size)
    ccall((:clang_executeOnThread, libclang), Cvoid, (Ptr{Cvoid}, Ptr{Cvoid}, UInt32), fn, user_data, stack_size)
end

"""
    clang_getCompletionChunkKind(completion_string, chunk_number)

Determine the kind of a particular chunk within a completion string.

# Arguments
- `completion_string`: the completion string to query.

- `chunk_number`: the 0-based index of the chunk in the completion string.

# Return
- the kind of the chunk at the index `chunk_number` 
"""
function clang_getCompletionChunkKind(completion_string, chunk_number)
    ccall((:clang_getCompletionChunkKind, libclang), CXCompletionChunkKind, (CXCompletionString, UInt32), completion_string, chunk_number)
end

"""
    clang_getCompletionChunkText(completion_string, chunk_number)

Retrieve the text associated with a particular chunk within a
completion string.

# Arguments
- `completion_string`: the completion string to query.

- `chunk_number`: the 0-based index of the chunk in the completion string.

# Return
- the text associated with the chunk at index `chunk_number` 
"""
function clang_getCompletionChunkText(completion_string, chunk_number)
    ccall((:clang_getCompletionChunkText, libclang), CXString, (CXCompletionString, UInt32), completion_string, chunk_number)
end

"""
    clang_getCompletionChunkCompletionString(completion_string, chunk_number)

Retrieve the completion string associated with a particular chunk
within a completion string.

# Arguments
- `completion_string`: the completion string to query.

- `chunk_number`: the 0-based index of the chunk in the completion string.

# Return
- the completion string associated with the chunk at index
`chunk_number` 
"""
function clang_getCompletionChunkCompletionString(completion_string, chunk_number)
    ccall((:clang_getCompletionChunkCompletionString, libclang), CXCompletionString, (CXCompletionString, UInt32), completion_string, chunk_number)
end

"""
    clang_getNumCompletionChunks(completion_string)

Retrieve the number of chunks in the given code-completion string.
"""
function clang_getNumCompletionChunks(completion_string)
    ccall((:clang_getNumCompletionChunks, libclang), UInt32, (CXCompletionString,), completion_string)
end

"""
    clang_getCompletionPriority(completion_string)

Determine the priority of this code completion.

The priority of a code completion indicates how likely it is that this 
particular completion is the completion that the user will select. The
priority is selected by various internal heuristics.

# Arguments
- `completion_string`: The completion string to query.

# Return
- The priority of this completion string. Smaller values indicate
higher-priority (more likely) completions.
"""
function clang_getCompletionPriority(completion_string)
    ccall((:clang_getCompletionPriority, libclang), UInt32, (CXCompletionString,), completion_string)
end

"""
    clang_getCompletionAvailability(completion_string)

Determine the availability of the entity that this code-completion
string refers to.

# Arguments
- `completion_string`: The completion string to query.

# Return
- The availability of the completion string.
"""
function clang_getCompletionAvailability(completion_string)
    ccall((:clang_getCompletionAvailability, libclang), CXAvailabilityKind, (CXCompletionString,), completion_string)
end

"""
    clang_getCompletionNumAnnotations(completion_string)

Retrieve the number of annotations associated with the given
completion string.

# Arguments
- `completion_string`: the completion string to query.

# Return
- the number of annotations associated with the given completion
string.
"""
function clang_getCompletionNumAnnotations(completion_string)
    ccall((:clang_getCompletionNumAnnotations, libclang), UInt32, (CXCompletionString,), completion_string)
end

"""
    clang_getCompletionAnnotation(completion_string, annotation_number)

Retrieve the annotation associated with the given completion string.

# Arguments
- `completion_string`: the completion string to query.

- `annotation_number`: the 0-based index of the annotation of the
completion string.

# Return
- annotation string associated with the completion at index
`annotation_number,` or a NULL string if that annotation is not available.
"""
function clang_getCompletionAnnotation(completion_string, annotation_number)
    ccall((:clang_getCompletionAnnotation, libclang), CXString, (CXCompletionString, UInt32), completion_string, annotation_number)
end

"""
    clang_getCompletionParent(completion_string, kind)

Retrieve the parent context of the given completion string.

The parent context of a completion string is the semantic parent of 
the declaration (if any) that the code completion represents. For example,
a code completion for an Objective-C method would have the method's class
or protocol as its context.

# Arguments
- `completion_string`: The code completion string whose parent is
being queried.

- `kind`: DEPRECATED: always set to CXCursor_NotImplemented if non-NULL.

# Return
- The name of the completion parent, e.g., \"NSObject\" if
the completion string represents a method in the NSObject class.
"""
function clang_getCompletionParent(completion_string, kind)
    ccall((:clang_getCompletionParent, libclang), CXString, (CXCompletionString, Ptr{CXCursorKind}), completion_string, kind)
end

"""
    clang_getCompletionBriefComment(completion_string)

Retrieve the brief documentation comment attached to the declaration
that corresponds to the given completion string.
"""
function clang_getCompletionBriefComment(completion_string)
    ccall((:clang_getCompletionBriefComment, libclang), CXString, (CXCompletionString,), completion_string)
end

"""
    clang_getCursorCompletionString(cursor)

Retrieve a completion string for an arbitrary declaration or macro
definition cursor.

# Arguments
- `cursor`: The cursor to query.

# Return
- A non-context-sensitive completion string for declaration and macro
definition cursors, or NULL for other kinds of cursors.
"""
function clang_getCursorCompletionString(cursor)
    ccall((:clang_getCursorCompletionString, libclang), CXCompletionString, (CXCursor,), cursor)
end

"""
    clang_defaultCodeCompleteOptions()

Returns a default set of code-completion options that can be
passed to`clang_codeCompleteAt().` 
"""
function clang_defaultCodeCompleteOptions()
    ccall((:clang_defaultCodeCompleteOptions, libclang), UInt32, ())
end

"""
    clang_codeCompleteAt(TU, complete_filename, complete_line, complete_column, unsaved_files, num_unsaved_files, options)

Perform code completion at a given location in a translation unit.

This function performs code completion at a particular file, line, and
column within source code, providing results that suggest potential
code snippets based on the context of the completion. The basic model
for code completion is that Clang will parse a complete source file,
performing syntax checking up to the location where code-completion has
been requested. At that point, a special code-completion token is passed
to the parser, which recognizes this token and determines, based on the
current location in the C/Objective-C/C++ grammar and the state of
semantic analysis, what completions to provide. These completions are
returned via a new `CXCodeCompleteResults` structure.

Code completion itself is meant to be triggered by the client when the
user types punctuation characters or whitespace, at which point the
code-completion location will coincide with the cursor. For example, if \\c p
is a pointer, code-completion might be triggered after the \"-\" and then
after the \">\" in `p->.` When the code-completion location is afer the \">\",
the completion results will provide, e.g., the members of the struct that
\"p\" points to. The client is responsible for placing the cursor at the
beginning of the token currently being typed, then filtering the results
based on the contents of the token. For example, when code-completing for
the expression `p->get,` the client should provide the location just after
the \">\" (e.g., pointing at the \"g\") to this code-completion hook. Then, the
client can filter the results based on the current token text (\"get\"), only
showing those results that start with \"get\". The intent of this interface
is to separate the relatively high-latency acquisition of code-completion
results from the filtering of results on a per-character basis, which must
have a lower latency.

# Arguments
- `TU`: The translation unit in which code-completion should
occur. The source files for this translation unit need not be
completely up-to-date (and the contents of those source files may
be overridden via \\p unsaved_files). Cursors referring into the
translation unit may be invalidated by this invocation.

- `complete_filename`: The name of the source file where code
completion should be performed. This filename may be any file
included in the translation unit.

- `complete_line`: The line at which code-completion should occur.

- `complete_column`: The column at which code-completion should occur.
Note that the column should point just after the syntactic construct that
initiated code completion, and not in the middle of a lexical token.

- `unsaved_files`: the Files that have not yet been saved to disk
but may be required for parsing or code completion, including the
contents of those files.  The contents and name of these files (as
specified by CXUnsavedFile) are copied when necessary, so the
client only needs to guarantee their validity until the call to
this function returns.

- `num_unsaved_files`: The number of unsaved file entries in \\p
unsaved_files.

- `options`: Extra options that control the behavior of code
completion, expressed as a bitwise OR of the enumerators of the
CXCodeComplete_Flags enumeration. The 
`clang_defaultCodeCompleteOptions()` function returns a default set
of code-completion options.

# Return
- If successful, a new `CXCodeCompleteResults` structure
containing code-completion results, which should eventually be
freed with `clang_disposeCodeCompleteResults().` If code
completion fails, returns NULL.
"""
function clang_codeCompleteAt(TU, complete_filename, complete_line, complete_column, unsaved_files, num_unsaved_files, options)
    ccall((:clang_codeCompleteAt, libclang), Ptr{CXCodeCompleteResults}, (CXTranslationUnit, Cstring, UInt32, UInt32, Ptr{CXUnsavedFile}, UInt32, UInt32), TU, complete_filename, complete_line, complete_column, unsaved_files, num_unsaved_files, options)
end

"""
    clang_sortCodeCompletionResults(Results, NumResults)

Sort the code-completion results in case-insensitive alphabetical 
order.

# Arguments
- `Results`: The set of results to sort.
- `NumResults`: The number of results in \\p Results.
"""
function clang_sortCodeCompletionResults(Results, NumResults)
    ccall((:clang_sortCodeCompletionResults, libclang), Cvoid, (Ptr{CXCompletionResult}, UInt32), Results, NumResults)
end

"""
    clang_disposeCodeCompleteResults(Results)

Free the given set of code-completion results.
"""
function clang_disposeCodeCompleteResults(Results)
    ccall((:clang_disposeCodeCompleteResults, libclang), Cvoid, (Ptr{CXCodeCompleteResults},), Results)
end

"""
    clang_codeCompleteGetNumDiagnostics(Results)

Determine the number of diagnostics produced prior to the
location where code completion was performed.
"""
function clang_codeCompleteGetNumDiagnostics(Results)
    ccall((:clang_codeCompleteGetNumDiagnostics, libclang), UInt32, (Ptr{CXCodeCompleteResults},), Results)
end

"""
    clang_codeCompleteGetDiagnostic(Results, Index)

Retrieve a diagnostic associated with the given code completion.

# Arguments
- `Results`: the code completion results to query.
- `Index`: the zero-based diagnostic number to retrieve.

# Return
- the requested diagnostic. This diagnostic must be freed
via a call to `clang_disposeDiagnostic()` 
"""
function clang_codeCompleteGetDiagnostic(Results, Index)
    ccall((:clang_codeCompleteGetDiagnostic, libclang), CXDiagnostic, (Ptr{CXCodeCompleteResults}, UInt32), Results, Index)
end

"""
    clang_codeCompleteGetContexts(Results)

Determines what completions are appropriate for the context
the given code completion.

# Arguments
- `Results`: the code completion results to query

# Return
- the kinds of completions that are appropriate for use
along with the given code completion results.
"""
function clang_codeCompleteGetContexts(Results)
    ccall((:clang_codeCompleteGetContexts, libclang), Culonglong, (Ptr{CXCodeCompleteResults},), Results)
end

"""
    clang_codeCompleteGetContainerKind(Results, IsIncomplete)

Returns the cursor kind for the container for the current code
completion context. The container is only guaranteed to be set for
contexts where a container exists (i.e. member accesses or Objective-C
message sends); if there is not a container, this function will return
CXCursor_InvalidCode.

# Arguments
- `Results`: the code completion results to query

- `IsIncomplete`: on return, this value will be false if Clang has complete
information about the container. If Clang does not have complete
information, this value will be true.

# Return
- the container kind, or CXCursor_InvalidCode if there is not a
container
"""
function clang_codeCompleteGetContainerKind(Results, IsIncomplete)
    ccall((:clang_codeCompleteGetContainerKind, libclang), CXCursorKind, (Ptr{CXCodeCompleteResults}, Ptr{UInt32}), Results, IsIncomplete)
end

"""
    clang_codeCompleteGetContainerUSR(Results)

Returns the USR for the container for the current code completion
context. If there is not a container for the current context, this
function will return the empty string.

# Arguments
- `Results`: the code completion results to query

# Return
- the USR for the container
"""
function clang_codeCompleteGetContainerUSR(Results)
    ccall((:clang_codeCompleteGetContainerUSR, libclang), CXString, (Ptr{CXCodeCompleteResults},), Results)
end

"""
    clang_codeCompleteGetObjCSelector(Results)

Returns the currently-entered selector for an Objective-C message
send, formatted like \"initWithFoo:bar:\". Only guaranteed to return a
non-empty string for CXCompletionContext_ObjCInstanceMessage and
CXCompletionContext_ObjCClassMessage.

# Arguments
- `Results`: the code completion results to query

# Return
- the selector (or partial selector) that has been entered thus far
for an Objective-C message send.
"""
function clang_codeCompleteGetObjCSelector(Results)
    ccall((:clang_codeCompleteGetObjCSelector, libclang), CXString, (Ptr{CXCodeCompleteResults},), Results)
end

"""
    clang_getClangVersion()

Return a version string, suitable for showing to a user, but not
       intended to be parsed (the format is not guaranteed to be stable).
"""
function clang_getClangVersion()
    ccall((:clang_getClangVersion, libclang), CXString, ())
end

"""
    clang_toggleCrashRecovery(isEnabled)

Enable/disable crash recovery.

# Arguments
- `isEnabled`: Flag to indicate if crash recovery is enabled.  A non-zero
       value enables crash recovery, while 0 disables it.
"""
function clang_toggleCrashRecovery(isEnabled)
    ccall((:clang_toggleCrashRecovery, libclang), Cvoid, (UInt32,), isEnabled)
end

"""
    clang_getInclusions(tu, visitor, client_data)

Visit the set of preprocessor inclusions in a translation unit.
  The visitor function is called with the provided data for every included
  file.  This does not include headers included by the PCH file (unless one
  is inspecting the inclusions in the PCH file itself).
"""
function clang_getInclusions(tu, visitor, client_data)
    ccall((:clang_getInclusions, libclang), Cvoid, (CXTranslationUnit, CXInclusionVisitor, CXClientData), tu, visitor, client_data)
end

"""
    clang_Cursor_Evaluate(C)

If cursor is a statement declaration tries to evaluate the 
statement and if its variable, tries to evaluate its initializer,
into its corresponding type.
"""
function clang_Cursor_Evaluate(C)
    ccall((:clang_Cursor_Evaluate, libclang), CXEvalResult, (CXCursor,), C)
end

"""
    clang_EvalResult_getKind(E)

Returns the kind of the evaluated result.
"""
function clang_EvalResult_getKind(E)
    ccall((:clang_EvalResult_getKind, libclang), CXEvalResultKind, (CXEvalResult,), E)
end

"""
    clang_EvalResult_getAsInt(E)

Returns the evaluation result as integer if the
kind is Int.
"""
function clang_EvalResult_getAsInt(E)
    ccall((:clang_EvalResult_getAsInt, libclang), Cint, (CXEvalResult,), E)
end

"""
    clang_EvalResult_getAsLongLong(E)

Returns the evaluation result as a long long integer if the
kind is Int. This prevents overflows that may happen if the result is
returned with clang_EvalResult_getAsInt.
"""
function clang_EvalResult_getAsLongLong(E)
    ccall((:clang_EvalResult_getAsLongLong, libclang), Clonglong, (CXEvalResult,), E)
end

"""
    clang_EvalResult_isUnsignedInt(E)

Returns a non-zero value if the kind is Int and the evaluation
result resulted in an unsigned integer.
"""
function clang_EvalResult_isUnsignedInt(E)
    ccall((:clang_EvalResult_isUnsignedInt, libclang), UInt32, (CXEvalResult,), E)
end

"""
    clang_EvalResult_getAsUnsigned(E)

Returns the evaluation result as an unsigned integer if
the kind is Int and clang_EvalResult_isUnsignedInt is non-zero.
"""
function clang_EvalResult_getAsUnsigned(E)
    ccall((:clang_EvalResult_getAsUnsigned, libclang), Culonglong, (CXEvalResult,), E)
end

"""
    clang_EvalResult_getAsDouble(E)

Returns the evaluation result as double if the
kind is double.
"""
function clang_EvalResult_getAsDouble(E)
    ccall((:clang_EvalResult_getAsDouble, libclang), Cdouble, (CXEvalResult,), E)
end

"""
    clang_EvalResult_getAsStr(E)

Returns the evaluation result as a constant string if the
kind is other than Int or float. User must not free this pointer,
instead call clang_EvalResult_dispose on the CXEvalResult returned
by clang_Cursor_Evaluate.
"""
function clang_EvalResult_getAsStr(E)
    ccall((:clang_EvalResult_getAsStr, libclang), Cstring, (CXEvalResult,), E)
end

"""
    clang_EvalResult_dispose(E)

Disposes the created Eval memory.
"""
function clang_EvalResult_dispose(E)
    ccall((:clang_EvalResult_dispose, libclang), Cvoid, (CXEvalResult,), E)
end

"""
    clang_getRemappings(path)

Retrieve a remapping.

# Arguments
- `path`: the path that contains metadata about remappings.

# Return
- the requested remapping. This remapping must be freed
via a call to `clang_remap_dispose().` Can return NULL if an error occurred.
"""
function clang_getRemappings(path)
    ccall((:clang_getRemappings, libclang), CXRemapping, (Cstring,), path)
end

"""
    clang_getRemappingsFromFileList(filePaths, numFiles)

Retrieve a remapping.

# Arguments
- `filePaths`: pointer to an array of file paths containing remapping info.

- `numFiles`: number of file paths.

# Return
- the requested remapping. This remapping must be freed
via a call to `clang_remap_dispose().` Can return NULL if an error occurred.
"""
function clang_getRemappingsFromFileList(filePaths, numFiles)
    ccall((:clang_getRemappingsFromFileList, libclang), CXRemapping, (Ptr{Cstring}, UInt32), filePaths, numFiles)
end

"""
    clang_remap_getNumFiles(arg1)

Determine the number of remappings.
"""
function clang_remap_getNumFiles(arg1)
    ccall((:clang_remap_getNumFiles, libclang), UInt32, (CXRemapping,), arg1)
end

"""
    clang_remap_getFilenames(arg1, index, original, transformed)

Get the original and the associated filename from the remapping.

# Arguments
- `original`: If non-NULL, will be set to the original filename.

- `transformed`: If non-NULL, will be set to the filename that the original
is associated with.
"""
function clang_remap_getFilenames(arg1, index, original, transformed)
    ccall((:clang_remap_getFilenames, libclang), Cvoid, (CXRemapping, UInt32, Ptr{CXString}, Ptr{CXString}), arg1, index, original, transformed)
end

"""
    clang_remap_dispose(arg1)

Dispose the remapping.
"""
function clang_remap_dispose(arg1)
    ccall((:clang_remap_dispose, libclang), Cvoid, (CXRemapping,), arg1)
end

"""
    clang_findReferencesInFile(cursor, file, visitor)

Find references of a declaration in a specific file.

# Arguments
- `cursor`: pointing to a declaration or a reference of one.

- `file`: to search for references.

- `visitor`: callback that will receive pairs of CXCursor/CXSourceRange for
each reference found.
The CXSourceRange will point inside the file; if the reference is inside
a macro (and not a macro argument) the CXSourceRange will be invalid.

# Return
- one of the CXResult enumerators.
"""
function clang_findReferencesInFile(cursor, file, visitor)
    ccall((:clang_findReferencesInFile, libclang), CXResult, (CXCursor, CXFile, CXCursorAndRangeVisitor), cursor, file, visitor)
end

"""
    clang_findIncludesInFile(TU, file, visitor)

Find #import/#include directives in a specific file.

# Arguments
- `TU`: translation unit containing the file to query.

- `file`: to search for #import/#include directives.

- `visitor`: callback that will receive pairs of CXCursor/CXSourceRange for
each directive found.

# Return
- one of the CXResult enumerators.
"""
function clang_findIncludesInFile(TU, file, visitor)
    ccall((:clang_findIncludesInFile, libclang), CXResult, (CXTranslationUnit, CXFile, CXCursorAndRangeVisitor), TU, file, visitor)
end

"""
    clang_index_isEntityObjCContainerKind(arg1)

"""
function clang_index_isEntityObjCContainerKind(arg1)
    ccall((:clang_index_isEntityObjCContainerKind, libclang), Cint, (CXIdxEntityKind,), arg1)
end

"""
    clang_index_getObjCContainerDeclInfo(arg1)

"""
function clang_index_getObjCContainerDeclInfo(arg1)
    ccall((:clang_index_getObjCContainerDeclInfo, libclang), Ptr{CXIdxObjCContainerDeclInfo}, (Ptr{CXIdxDeclInfo},), arg1)
end

"""
    clang_index_getObjCInterfaceDeclInfo(arg1)

"""
function clang_index_getObjCInterfaceDeclInfo(arg1)
    ccall((:clang_index_getObjCInterfaceDeclInfo, libclang), Ptr{CXIdxObjCInterfaceDeclInfo}, (Ptr{CXIdxDeclInfo},), arg1)
end

"""
    clang_index_getObjCCategoryDeclInfo(arg1)

"""
function clang_index_getObjCCategoryDeclInfo(arg1)
    ccall((:clang_index_getObjCCategoryDeclInfo, libclang), Ptr{CXIdxObjCCategoryDeclInfo}, (Ptr{CXIdxDeclInfo},), arg1)
end

"""
    clang_index_getObjCProtocolRefListInfo(arg1)

"""
function clang_index_getObjCProtocolRefListInfo(arg1)
    ccall((:clang_index_getObjCProtocolRefListInfo, libclang), Ptr{CXIdxObjCProtocolRefListInfo}, (Ptr{CXIdxDeclInfo},), arg1)
end

"""
    clang_index_getObjCPropertyDeclInfo(arg1)

"""
function clang_index_getObjCPropertyDeclInfo(arg1)
    ccall((:clang_index_getObjCPropertyDeclInfo, libclang), Ptr{CXIdxObjCPropertyDeclInfo}, (Ptr{CXIdxDeclInfo},), arg1)
end

"""
    clang_index_getIBOutletCollectionAttrInfo(arg1)

"""
function clang_index_getIBOutletCollectionAttrInfo(arg1)
    ccall((:clang_index_getIBOutletCollectionAttrInfo, libclang), Ptr{CXIdxIBOutletCollectionAttrInfo}, (Ptr{CXIdxAttrInfo},), arg1)
end

"""
    clang_index_getCXXClassDeclInfo(arg1)

"""
function clang_index_getCXXClassDeclInfo(arg1)
    ccall((:clang_index_getCXXClassDeclInfo, libclang), Ptr{CXIdxCXXClassDeclInfo}, (Ptr{CXIdxDeclInfo},), arg1)
end

"""
    clang_index_getClientContainer(arg1)

For retrieving a custom CXIdxClientContainer attached to a
container.
"""
function clang_index_getClientContainer(arg1)
    ccall((:clang_index_getClientContainer, libclang), CXIdxClientContainer, (Ptr{CXIdxContainerInfo},), arg1)
end

"""
    clang_index_setClientContainer(arg1, arg2)

For setting a custom CXIdxClientContainer attached to a
container.
"""
function clang_index_setClientContainer(arg1, arg2)
    ccall((:clang_index_setClientContainer, libclang), Cvoid, (Ptr{CXIdxContainerInfo}, CXIdxClientContainer), arg1, arg2)
end

"""
    clang_index_getClientEntity(arg1)

For retrieving a custom CXIdxClientEntity attached to an entity.
"""
function clang_index_getClientEntity(arg1)
    ccall((:clang_index_getClientEntity, libclang), CXIdxClientEntity, (Ptr{CXIdxEntityInfo},), arg1)
end

"""
    clang_index_setClientEntity(arg1, arg2)

For setting a custom CXIdxClientEntity attached to an entity.
"""
function clang_index_setClientEntity(arg1, arg2)
    ccall((:clang_index_setClientEntity, libclang), Cvoid, (Ptr{CXIdxEntityInfo}, CXIdxClientEntity), arg1, arg2)
end

"""
    clang_IndexAction_create(CIdx)

An indexing action/session, to be applied to one or multiple
translation units.

# Arguments
- `CIdx`: The index object with which the index action will be associated.
"""
function clang_IndexAction_create(CIdx)
    ccall((:clang_IndexAction_create, libclang), CXIndexAction, (CXIndex,), CIdx)
end

"""
    clang_IndexAction_dispose(arg1)

Destroy the given index action.

The index action must not be destroyed until all of the translation units
created within that index action have been destroyed.
"""
function clang_IndexAction_dispose(arg1)
    ccall((:clang_IndexAction_dispose, libclang), Cvoid, (CXIndexAction,), arg1)
end

"""
    clang_indexSourceFile(arg1, client_data, index_callbacks, index_callbacks_size, index_options, source_filename, command_line_args, num_command_line_args, unsaved_files, num_unsaved_files, out_TU, TU_options)

Index the given source file and the translation unit corresponding
to that file via callbacks implemented through #IndexerCallbacks.

# Arguments
- `client_data`: pointer data supplied by the client, which will
be passed to the invoked callbacks.

- `index_callbacks`: Pointer to indexing callbacks that the client
implements.

- `index_callbacks_size`: Size of #IndexerCallbacks structure that gets
passed in index_callbacks.

- `index_options`: A bitmask of options that affects how indexing is
performed. This should be a bitwise OR of the CXIndexOpt_XXX flags.

\\param[out] out_TU pointer to store a `CXTranslationUnit` that can be
reused after indexing is finished. Set to `NULL` if you do not require it.

# Return
- 0 on success or if there were errors from which the compiler could
recover.  If there is a failure from which there is no recovery, returns
a non-zero `CXErrorCode` 

The rest of the parameters are the same as #clang_parseTranslationUnit.
"""
function clang_indexSourceFile(arg1, client_data, index_callbacks, index_callbacks_size, index_options, source_filename, command_line_args, num_command_line_args, unsaved_files, num_unsaved_files, out_TU, TU_options)
    ccall((:clang_indexSourceFile, libclang), Cint, (CXIndexAction, CXClientData, Ptr{IndexerCallbacks}, UInt32, UInt32, Cstring, Ptr{Cstring}, Cint, Ptr{CXUnsavedFile}, UInt32, Ptr{CXTranslationUnit}, UInt32), arg1, client_data, index_callbacks, index_callbacks_size, index_options, source_filename, command_line_args, num_command_line_args, unsaved_files, num_unsaved_files, out_TU, TU_options)
end

"""
    clang_indexSourceFileFullArgv(arg1, client_data, index_callbacks, index_callbacks_size, index_options, source_filename, command_line_args, num_command_line_args, unsaved_files, num_unsaved_files, out_TU, TU_options)

Same as clang_indexSourceFile but requires a full command line
for `command_line_args` including argv[0]. This is useful if the standard
library paths are relative to the binary.
"""
function clang_indexSourceFileFullArgv(arg1, client_data, index_callbacks, index_callbacks_size, index_options, source_filename, command_line_args, num_command_line_args, unsaved_files, num_unsaved_files, out_TU, TU_options)
    ccall((:clang_indexSourceFileFullArgv, libclang), Cint, (CXIndexAction, CXClientData, Ptr{IndexerCallbacks}, UInt32, UInt32, Cstring, Ptr{Cstring}, Cint, Ptr{CXUnsavedFile}, UInt32, Ptr{CXTranslationUnit}, UInt32), arg1, client_data, index_callbacks, index_callbacks_size, index_options, source_filename, command_line_args, num_command_line_args, unsaved_files, num_unsaved_files, out_TU, TU_options)
end

"""
    clang_indexTranslationUnit(arg1, client_data, index_callbacks, index_callbacks_size, index_options, arg2)

Index the given translation unit via callbacks implemented through
#IndexerCallbacks.

The order of callback invocations is not guaranteed to be the same as
when indexing a source file. The high level order will be:

  -Preprocessor callbacks invocations
  -Declaration/reference callbacks invocations
  -Diagnostic callback invocations

The parameters are the same as #clang_indexSourceFile.

# Return
- If there is a failure from which there is no recovery, returns
non-zero, otherwise returns 0.
"""
function clang_indexTranslationUnit(arg1, client_data, index_callbacks, index_callbacks_size, index_options, arg2)
    ccall((:clang_indexTranslationUnit, libclang), Cint, (CXIndexAction, CXClientData, Ptr{IndexerCallbacks}, UInt32, UInt32, CXTranslationUnit), arg1, client_data, index_callbacks, index_callbacks_size, index_options, arg2)
end

"""
    clang_indexLoc_getFileLocation(loc, indexFile, file, line, column, offset)

Retrieve the CXIdxFile, file, line, column, and offset represented by
the given CXIdxLoc.

If the location refers into a macro expansion, retrieves the
location of the macro expansion and if it refers into a macro argument
retrieves the location of the argument.
"""
function clang_indexLoc_getFileLocation(loc, indexFile, file, line, column, offset)
    ccall((:clang_indexLoc_getFileLocation, libclang), Cvoid, (CXIdxLoc, Ptr{CXIdxClientFile}, Ptr{CXFile}, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}), loc, indexFile, file, line, column, offset)
end

"""
    clang_indexLoc_getCXSourceLocation(loc)

Retrieve the CXSourceLocation represented by the given CXIdxLoc.
"""
function clang_indexLoc_getCXSourceLocation(loc)
    ccall((:clang_indexLoc_getCXSourceLocation, libclang), CXSourceLocation, (CXIdxLoc,), loc)
end

"""
    clang_Type_visitFields(T, visitor, client_data)

Visit the fields of a particular type.

This function visits all the direct fields of the given cursor,
invoking the given \\p visitor function with the cursors of each
visited field. The traversal may be ended prematurely, if
the visitor returns `CXFieldVisit_Break` 

# Arguments
- `T`: the record type whose field may be visited.

- `visitor`: the visitor function that will be invoked for each
field of \\p T.

- `client_data`: pointer data supplied by the client, which will
be passed to the visitor each time it is invoked.

# Return
- a non-zero value if the traversal was terminated
prematurely by the visitor returning `CXFieldVisit_Break` 
"""
function clang_Type_visitFields(T, visitor, client_data)
    ccall((:clang_Type_visitFields, libclang), UInt32, (CXType, CXFieldVisitor, CXClientData), T, visitor, client_data)
end
# Julia wrapper for header: Platform.h
# Automatically generated using Clang.jl

