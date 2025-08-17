local M = {}
local vim = vim

---@param colors BackpackColors
---@param config? BackpackConfig
function M.setup(colors, config)
    config = config or require("backpack").config
    local theme = colors.theme

    return {
        -- @variable                       various variable names
        ["@variable"] = { fg = theme.ui.fg },
        -- @variable.builtin (Special)     built-in variable names (e.g. `this`, `self`)
        ["@variable.builtin"] = { fg = theme.syn.special2, italic = true },
        ["@variable.builtin.ruby"] = { fg = theme.syn.string },
        ["@variable.builtin.javascript"] = { fg = theme.syn.deprecated },
        -- @variable.parameter             parameters of a function
        ["@variable.parameter"] = { fg = theme.syn.parameter },
        -- @variable.parameter.builtin     special parameters (e.g. `_`, `it`)
        -- @variable.member                object and struct fields
        ["@variable.member"] = { fg = theme.syn.identifier },
        --
        -- @constant (Constant)              constant identifiers
        ["@constant.cpp"] = { fg = theme.syn.type },
        -- @constant.builtin       built-in constant values
        ["@constant.builtin"] = { fg = theme.syn.string, italic = true },
        ["@constant.builtin.javascript"] = { fg = theme.syn.string },
        ["@constant.builtin.typescript"] = { fg = theme.syn.string },
        -- @constant.macro         constants defined by the preprocessor
        --
        -- @module (Structure)      modules or namespaces
        -- @module.builtin         built-in modules or namespaces
        ["@module.builtin.lua"] = { fg = theme.syn.operator },
        -- @label                  `GOTO` and other labels (e.g. `label:` in C), including heredoc labels
        --
        -- @string                 string literals
        -- @string.documentation   string documenting code (e.g. Python docstrings)
        -- @string.regexp          regular expressions
        ["@string.regexp"] = { fg = theme.syn.regex },
        -- @string.escape          escape sequences
        ["@string.escape"] = { fg = theme.syn.regex, bold = true },
        -- @string.special         other special strings (e.g. dates)
        -- @string.special.symbol  symbols or atoms
        ["@string.special.symbol"] = { fg = theme.syn.identifier },
        -- @string.special.path    filenames
        -- @string.special.url (Underlined)     URIs (e.g. hyperlinks)
        ["@string.special.url"] = { fg = theme.syn.special1, undercurl = true },
        -- @character              character literals
        -- @character.special      special characters (e.g. wildcards)
        --
        -- @boolean                boolean literals
        -- @number                 numeric literals
        -- @number.float           floating-point number literals
        --
        -- @type                   type or class definitions and annotations
         ["@type"] = { fg = theme.syn.type },
        -- @type.builtin           built-in types
        ["@type.builtin.javascript"] = { fg = theme.syn.preproc },
        ["@type.builtin.tsx"] = { fg = theme.syn.string },
        ["@type.builtin.typescript"] = { fg = theme.syn.string },
        ["@type.builtin.cpp"] = { fg = theme.syn.deprecated },
        -- ["@type.builtin.java"] = { fg = theme.syn.string, bold = true },
        ["@type.builtin.java"] = { fg = theme.syn.deprecated, italic = true },


        ["@type.javascript"] = { fg = 'none' },
        ["@type.tsx"] = { fg = 'none' },
        ["@type.ruby"] = { fg = theme.syn.type },
        ["@type.cpp"] = { fg = theme.syn.constant },
        ["@type.java"] = { fg = theme.syn.constant, italic = true },
        -- @type.definition        identifiers in type definitions (e.g. `typedef <type> <identifier>` in C)
        --
        -- @attribute              attribute annotations (e.g. Python decorators, Rust lifetimes)
        ["@attribute"] = { link = "Constant" },
        ["@attribute.python"] = { fg = theme.ui.special },
        -- @attribute.builtin      builtin annotations (e.g. `@property` in Python)
        -- @property               the key in key/value pairs
        --
        -- @function               function definitions
        -- @function.builtin       built-in functions
        ["@function.builtin.python"] = { fg = theme.syn.type },
        ["@function.builtin.lua"] = { fg = theme.syn.constant },
        -- @function.call          function calls
        -- @function.macro         preprocessor macros
        --
        -- @function.method        method definitions
        ["@function.method.java"] = { fg = theme.syn.type },
        -- @function.method.call   method calls
        ["@function.javascript"] = { fg = theme.syn.type },
        ["@function.typescript"] = { fg = theme.syn.type },
        ["@function.tsx"] = { fg = theme.syn.type },

        ["@function.ruby"] = { fg = theme.syn.deprecated },
        ["@function.python"] = { fg = theme.syn.preproc },
        ["@function.cpp"] = { fg = theme.syn.type },

        ["@function.call.ruby"] = { fg = theme.ui.fg },
        --
        -- @constructor            constructor calls and definitions
        ["@constructor"] = { fg = theme.syn.special1 },
        ["@constructor.lua"] = { fg = theme.syn.keyword },
        ["@label.lua"] = { fg = theme.syn.keyword },
        ["@string.lua"] = { fg = theme.syn.string },
        ["@string.special.symbol.ruby"] = { fg = theme.syn.string },
        ["@property.lua"] = { fg = theme.syn.identifier },
        -- @operator               symbolic operators (e.g. `+`, `*`)
        ["@operator"] = { link = "Operator" },
        ["@keyword.operator"] = { fg = theme.syn.opkeyword },
        --
        -- @keyword                keywords not fitting into specific categories
        -- @keyword.coroutine      keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
        ["@keyword.coroutine"] = { fg = theme.syn.deprecated },
        ["@keyword.coroutine.javascript"] = { fg = theme.syn.deprecated },
        ["@keyword.coroutine.typescript"] = { fg = theme.syn.deprecated },
        -- @keyword.function       keywords that define a function (e.g. `func` in Go, `def` in Python)
        ["@keyword.function"] = { fg = theme.syn.deprecated },
        ["@keyword.function.javascript"] = { fg = theme.syn.deprecated },
        ["@keyword.function.typescript"] = { fg = theme.syn.deprecated },
        ["@keyword.function.lua"] = { fg = theme.ui.fg, bold = true },
        ["@keyword.function.ruby"] = { fg = theme.syn.preproc },
        ["@keyword.function.python"] = { fg = theme.syn.statement },
        -- @keyword.operator       operators that are English words (e.g. `and`, `or`)
        -- @keyword.import         keywords for including modules (e.g. `import`, `from` in Python)
        ["@keyword.import"] = { link = "PreProc" },
        ["@keyword.import.javascriptreact"] = { fg = theme.syn.opkeyword },
        ["@keyword.import.javascript"] = { fg = theme.syn.opkeyword },
        ["@keyword.import.typescript"] = { fg = theme.syn.opkeyword },
        ["@keyword.import.typescriptreact"] = { fg = theme.syn.opkeyword },
        ["@keyword.import.tsx"] = { fg = theme.syn.opkeyword },


        -- Custom highlight groups created by me
        ["@backpack.import"] = { fg = theme.syn.statement },
        ["@backpack.exp.javascript"] = { fg = theme.syn.opkeyword, italic = true },
        ["@backpack.exp.javascriptreact"] = { fg = theme.syn.opkeyword },
        ["@backpack.default.javascript"] = { fg = theme.syn.constant, italic = true },
        ["@backpack.from.javascript"] = { fg = theme.syn.preproc },
        ["@backpack.from.javascriptreact"] = { fg = theme.syn.preproc },
        ["@backpack.exp.typescript"] = { fg = theme.syn.opkeyword, italic = true },
        ["@backpack.exp.typescriptreact"] = { fg = theme.syn.opkeyword },
        ["@backpack.default.typescript"] = { fg = theme.syn.constant, italic = true },
        ["@backpack.from.typescript"] = { fg = theme.syn.preproc },
        ["@backpack.from.typescriptreact"] = { fg = theme.syn.preproc },
        ["@backpack.exp.tsx"] = { fg = theme.syn.opkeyword, italic = true },
        ["@backpack.default.tsx"] = { fg = theme.syn.constant, italic = true },
        ["@backpack.from.tsx"] = { fg = theme.syn.preproc },
        ["@backpack.function.arrow"] = { fg = theme.ui.fg },
        -- End custom highlight groups


        ["@keyword.import.python"] = { fg = theme.syn.deprecated },
        -- ["@keyword.import.javascript"] = { fg = theme.syn.opkeyword },
        ["@keyword.javascript"] = { fg = theme.syn.statement },
        ["@keyword.typescript"] = { fg = theme.syn.statement },
        ["@keyword.tsx"] = { fg = theme.syn.statement },
        ["@keyword.lua"] = { fg = theme.ui.fg, bold = true },
        ["@keyword"] = { fg = theme.syn.statement },

        -- @keyword.type           keywords defining composite types (e.g. `struct`, `enum`)
        ["@keyword.type.java"] = { fg = theme.syn.type },
        -- @keyword.modifier       keywords defining type modifiers (e.g. `const`, `static`, `public`)
        ["@keyword.modifier.ruby"] = { fg = theme.syn.opkeyword },
        ["@keyword.modifier.java"] = { fg = theme.syn.special4, italic = true },
        -- @keyword.repeat         keywords related to loops (e.g. `for`, `while`)
        -- @keyword.return         keywords like `return` and `yield`
        ["@keyword.return"] = vim.tbl_extend("force", { fg = theme.syn.statement }, config.returnStyle),
        ["@keyword.return.javascript"] = { fg = theme.syn.statement },
        ["@keyword.return.typescript"] = { fg = theme.syn.statement },
        ["@keyword.return.lua"] = { fg = theme.ui.fg, bold = true },
        -- @keyword.debug          keywords related to debugging
        -- @keyword.exception      keywords related to exceptions (e.g. `throw`, `catch`)
        ["@keyword.exception"] = vim.tbl_extend("force", { fg = theme.syn.special3 }, config.statementStyle),
        ["@keyword.exception.cpp"] = { fg = theme.syn.opkeyword },
        ["@keyword.exception.java"] = { fg = theme.syn.preproc },
        ["@keyword.exception.ruby"] = { fg = theme.syn.opkeyword },
        ["@keyword.exception.python"] = { fg = theme.syn.statement },

        ["@keyword.luap"] = { link = "@string.regex" },
        --
        ["@keyword.conditional"] = { fg = theme.syn.statement },    --    keywords related to conditionals (e.g. `if`, `else`) 
        ["@keyword.conditional.lua"] = { fg = theme.ui.fg, bold = true },    --    keywords related to conditionals (e.g. `if`, `else`) 
        -- @keyword.conditional.ternary ternary operator (e.g. `?`, `:`)
        --
        -- @keyword.directive           various preprocessor directives and shebangs
        -- @keyword.directive.define    preprocessor definition directives
        --
        -- @punctuation.delimiter  delimiters (e.g. `;`, `.`, `,`)
        ["@punctuation.delimiter"] = { fg = theme.syn.punct },
        -- @punctuation.bracket    brackets (e.g. `()`, `{}`, `[]`)
        ["@punctuation.bracket"] = { fg = theme.syn.punct },
        -- @punctuation.special    special symbols (e.g. `{}` in string interpolation)
        ["@punctuation.special"] = { fg = theme.syn.special1 },
        --
        -- @comment                line and block comments
        -- @comment.documentation  comments documenting code
        --
        -- @comment.error          error-type comments (e.g. `ERROR`, `FIXME`, `DEPRECATED`)
        ["@comment.error"] = { fg = theme.ui.fg, bg = theme.diag.error, bold = true },
        -- @comment.warning        warning-type comments (e.g. `WARNING`, `FIX`, `HACK`)
        ["@comment.warning"] = { fg = theme.ui.fg_reverse, bg = theme.diag.warning, bold = true },
        -- @comment.todo           todo-type comments (e.g. `TODO`, `WIP`)
        -- @comment.note           note-type comments (e.g. `NOTE`, `INFO`, `XXX`)
        ["@comment.note"] = { fg = theme.ui.fg_reverse, bg = theme.diag.hint, bold = true },
        --
        -- @markup.strong          bold text
        ["@markup.strong"] = { bold = true },
        -- @markup.italic          italic text
        ["@markup.italic"] = { italic = true },
        -- @markup.strikethrough   struck-through text
        ["@markup.strikethrough"] = { strikethrough = true },
        -- @markup.underline       underlined text (only for literal underline markup!)
        ["@markup.underline"] = { underline = true },
        --
        -- @markup.heading         headings, titles (including markers)
        ["@markup.heading"] = { link = "Function" },
        -- @markup.heading.1       top-level heading
        -- @markup.heading.2       section heading
        -- @markup.heading.3       subsection heading
        -- @markup.heading.4       and so on
        -- @markup.heading.5       and so forth
        -- @markup.heading.6       six levels ought to be enough for anybody
        --
        -- @markup.quote           block quotes
        ["@markup.quote"] = { link = "@variable.parameter" },
        -- @markup.math            math environments (e.g. `$ ... $` in LaTeX)
        ["@markup.math"] = { link = "Constant" },
        -- @markup.environment     environments (e.g. in LaTeX)
        ["@markup.environment"] = { link = "Keyword" },
        --
        -- @markup.link            text references, footnotes, citations, etc.
        -- @markup.link.label      link, reference descriptions
        -- @markup.link.url        URL-style links
        ["@markup.link.url"] = { link = "@string.special.url" },
        -- @markup.raw             literal or verbatim text (e.g. inline code)
        ["@markup.raw"] = { link = "String" },
        -- @markup.raw.block       literal or verbatim text as a stand-alone block
        --
        -- @markup.list            list markers
        -- @markup.list.checked    checked todo-style list markers
        -- @markup.list.unchecked  unchecked todo-style list markers
        --
        -- @diff.plus              added text (for diff files)
        ["@diff.plus"] = { fg = theme.vcs.added },
        -- @diff.minus             deleted text (for diff files)
        ["@diff.minus"] = { fg = theme.vcs.removed },
        -- @diff.delta             changed text (for diff files)
        ["@diff.delta"] = { fg = theme.vcs.changed },
        --
        -- @tag                    XML-style tag names (e.g. in XML, HTML, etc.)
        -- @tag.builtin            XML-style tag names (e.g. HTML5 tags)
        -- @tag.attribute          XML-style tag attributes
        ["@tag.attribute"] = { fg = theme.syn.type },
        -- @tag.delimiter          XML-style tag delimiters
        ["@tag.delimiter"] = { fg = theme.syn.punct },
        ["@tag.builtin"] = { fg = theme.syn.statement },
        ["@tag"] = { fg = theme.syn.statement },
    }
end

return M
--vim: fdm=marker
