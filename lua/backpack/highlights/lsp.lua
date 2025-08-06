local M = {}
---@param colors BackpackColors
---@param config? BackpackConfig
function M.setup(colors, config)
    config = config or require("backpack").config
    local theme = colors.theme
    return {
        -- ["@lsp.type.class"] = { link = "Structure" },
    --
    --
        -- ["@lsp.type.decorator"] = { link = "Function" },
        -- ["@lsp.type.enum"] = { link = "Structure" },
        -- ["@lsp.type.enumMember"] = { link = "Constant" },
        -- ["@lsp.type.function"] = { link = "Function" },
        ["@lsp.type.function.typescriptreact"] = { fg = 'none' },
        ["@lsp.type.function.javascriptreact"] = { fg = 'none' },
        ["@lsp.type.function.cpp"] = { fg = theme.syn.type },
        -- ["@lsp.type.interface"] = { link = "Structure" },
        ["@lsp.type.macro"] = { link = "Macro" },
        ["@lsp.type.method"] = { link = "@function.method" },       -- Function
        ["@lsp.type.namespace"] = { link = "@module" },             -- Structure
        ["@lsp.type.parameter"] = { link = "@variable.parameter" }, -- Identifier
        -- ["@lsp.type.property"] = { link = "Identifier" },
        -- ["@lsp.type.struct"] = { link = "Structure" },
        -- ["@lsp.type.type"] = { link = "Type" },
        -- ["@lsp.type.typeParameter"] = { link = "TypeDef" },
        ["@lsp.type.variable"] = { fg = "none" }, -- Identifier
        ["@lsp.type.comment"] = { link = "Comment" },  -- Comment

        ["@lsp.type.const"] = { link = "Constant" },
        ["@lsp.type.comparison"] = { link = "Operator" },
        ["@lsp.type.bitwise"] = { link = "Operator" },
        ["@lsp.type.punctuation"] = { link = "Delimiter" },

        ["@lsp.type.selfParameter"] = { link = "@variable.builtin" },
        -- ["@lsp.type.builtinConstant"] = { link = "@constant.builtin" },
        ["@lsp.type.builtinConstant"] = { link = "@constant.builtin" },
        ["@lsp.type.magicFunction"] = { link = "@function.builtin" },

        ["@lsp.mod.readonly"] = { link = "Constant" },
        ["@lsp.mod.readonly.typescriptreact"] = { fg = 'none' },
        ["@lsp.mod.readonly.typescript"] = { fg = 'none' },
        ["@lsp.mod.readonly.javascript"] = { fg = 'none' },
        ["@lsp.mod.readonly.javascriptreact"] = { fg = 'none' },
        ["@lsp.typemod.variable.declaration.javascript"] =  { fg = theme.syn.operator },
        ["@lsp.typemod.variable.declaration.typescript"] =  { fg = theme.syn.operator },
        ["@lsp.typemod.variable.declaration.typescriptreact"] =  { fg = theme.syn.operator },
        ["@lsp.typemod.variable.declaration.javascriptreact"] =  { fg = theme.syn.operator },
        -- ["@lsp.typemod.function.local.javascriptreact"] = { fg = theme.syn.operator },
        -- ["@lsp.typemod.function.local.javascript"] = { fg = theme.syn.operator },
        -- ["@lsp.typemod.function.local.typescriptreact"] = { fg = theme.syn.operator },
        -- ["@lsp.typemod.function.local.typescript"] = { fg = theme.syn.operator },
        -- ["@lsp.mod.typeHint"] = { link = "Type" },
        -- ["@lsp.mod.defaultLibrary"] = { link = "Special" },
        -- ["@lsp.mod.builtin"] = { link = "Special" },
        ["@lsp.typemod.class.declaration.javascript"] = { fg = theme.syn.type },
        ["@lsp.typemod.class.declaration.typescript"] = { fg = theme.syn.type },
        ["@lsp.typemod.class.declaration.typescriptreact"] = { fg = theme.syn.type },
        ["@lsp.typemod.operator.controlFlow"] = { link = "@keyword.exception" }, -- rust ? operator
        ["@lsp.type.lifetime"] = { link = "Operator" },
        ["@lsp.typemod.keyword.documentation"] = { link = "Special" },
        ["@lsp.type.decorator.rust"] = { link = "PreProc" },

        ["@lsp.typemod.variable.global"] = { link = "Constant" },
        ["@lsp.typemod.variable.static"] = { link = "Constant" },
        ["@lsp.typemod.variable.defaultLibrary"] = { fg = theme.syn.preproc },
        ["@lsp.typemod.variable.defaultLibrary.javascriptreact"] = { fg = theme.syn.preproc, italic = true },
        ["@lsp.typemod.variable.defaultLibrary.javascript"] = { fg = theme.syn.preproc, italic = true },
        ["@lsp.typemod.variable.defaultLibrary.typescriptreact"] = { fg = theme.syn.preproc, italic = true },
        ["@lsp.typemod.variable.defaultLibrary.typescript"] = { fg = theme.syn.preproc, italic = true },

        ["@lsp.typemod.function.builtin"] = { link = "@function.builtin" },
        ["@lsp.typemod.function.defaultLibrary"] = { fg = theme.syn.operator },
        ["@lsp.typemod.method.defaultLibrary"] = { fg = theme.syn.operator },
        ["@lsp.typemod.class.defaultLibrary.javascriptreact"] = { fg = theme.syn.preproc, italic = true },
        ["@lsp.typemod.class.defaultLibrary.javascript"] = { fg = theme.syn.preproc, italic = true },
        ["@lsp.typemod.class.defaultLibrary.typescriptreact"] = { fg = theme.syn.preproc, italic = true },
        ["@lsp.typemod.class.defaultLibrary.typescript"] = { fg = theme.syn.preproc, italic = true },

        ["@lsp.typemod.variable.injected"] = { link = "@variable" },

        ["@lsp.typemod.function.readonly"] = { fg = 'none' },
    }
end

return M
--vim: fdm=marker
