-- local c = require("backpack.color")
local M = {}

---@param colors BackpackColors
---@param config? BackpackConfig
function M.setup(colors, config)
    local theme = colors.theme
    config = config or require("backpack").config

    return {
        -- *Comment	any comment
        Comment = vim.tbl_extend("force", { fg = theme.syn.comment }, config.commentStyle),

        -- *Constant	any constant
        Constant = { fg = theme.syn.constant },
        --  String		a string constant: "this is a string"
        String = { fg = theme.syn.string },
        --  Character	a character constant: 'c', '\n'
        Character = { link = "String" },
        --  Number		a number constant: 234, 0xff
        Number = { fg = theme.syn.number },
        --  Boolean	a boolean constant: TRUE, false
        Boolean = { fg = theme.syn.string },
        --  Float		a floating point constant: 2.3e10
        Float = { link = "Number" },

        -- *Identifier	any variable name
        Identifier = { fg = theme.syn.identifier },
        --  Function	function name (also: methods for classes)
        Function = vim.tbl_extend("force", { fg = theme.syn.fun }, config.functionStyle),

        -- *Statement	any statement
        Statement = vim.tbl_extend("force", { fg = theme.syn.statement }, config.statementStyle),
        --  Conditional	if, then, else, endif, switch, etc.
        --  Repeat		for, do, while, etc.
        --  Label		case, default, etc.
        --  Operator	"sizeof", "+", "*", etc.
        Operator = { fg = theme.syn.operator },
        --  Keyword	any other keyword
        Keyword = vim.tbl_extend("force", { fg = theme.syn.keyword }, config.keywordStyle),
        --  Exception	try, catch, throw
        Exception = { fg = theme.syn.special2 },

        -- *PreProc	generic Preprocessor
        -- PreProc = vim.tbl_extend("force", { fg = theme.syn.preproc }, config.typeStyle),
        --  Include	preprocessor #include
        --  Define		preprocessor #define
        --  Macro		same as Define
        --  PreCondit	preprocessor #if, #else, #endif, etc.
        PreProc = { fg = theme.syn.opkeyword },

        -- *Type		int, long, char, etc.
        -- Type = vim.tbl_extend("force", { fg = theme.syn.type }, config.typeStyle),
        --  StorageClass	static, register, volatile, etc.
        --  Structure	struct, union, enum, etc.
        --  Typedef	A typedef

        -- Special	any special symbol
        -- Special = { fg = theme.syn.statement },
        --  SpecialChar	special character in a constant
        --  Tag		you can use CTRL-] on this
        --  Delimiter	character that needs attention
        Delimiter = { fg = theme.syn.punct },
        --  SpecialComment	special things inside a comment
        --  Debug		debugging statements

        -- *Underlined	text that stands out, HTML links
        Underlined = { fg = theme.syn.special1, underline = true },
        Bold = { bold = true },
        Italic = { italic = true },

        -- *Ignore		left blank, hidden  |hl-Ignore|
        Ignore = { link = "NonText" },

        -- *Error		any erroneous construct
        Error = { fg = theme.diag.error },

        -- *Todo		anything that needs extra attention; mostly the keywords TODO FIXME WARNING and XXX
        Todo = { fg = theme.ui.fg_reverse, bg = theme.diag.info, bold = true },

        qfLineNr = { link = "lineNr" },
        qfFileName = { link = "Directory" },

        -- htmlH1 = {},
        -- htmlH2 = {},

        -- mkdHeading = {},
        -- mkdCode = {},
        -- mkdCodeDelimiter = {},
        -- mkdCodeStart = {},
        -- mkdCodeEnd = {},
        -- mkdLink = {},

        -- markdownHeadingDelimiter = {},
        markdownCode = { fg = theme.syn.string },
        markdownCodeBlock = { fg = theme.syn.string },
        markdownEscape = { fg = "NONE" },
        -- markdownH1 = {},
        -- markdownH2 = {},
        -- markdownLinkText = {},
    }
end

return M
