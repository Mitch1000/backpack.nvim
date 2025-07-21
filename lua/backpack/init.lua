local M = {}

---@alias ColorSpec string RGB Hex string
---@alias ColorTable table<string, ColorSpec>
---@alias BackpackColorsSpec { palette: ColorTable, theme: ColorTable }
---@alias BackpackColors { palette: PaletteColors, theme: ThemeColors }

--- default config
---@class BackpackConfig
M.config = {
    undercurl = false,
    -- TODO: Remove vim_ setting values
    vim_italic = true,
    vim_bold = true,
    vim_underline = true,
    vim_inverse = true,
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { bold = true },
    tabSigns = false,
    statementStyle = { bold = false },
    returnStyle = { italic = false, bold = false },
    typeStyle = {},
    transparent = false,
    dimInactive = false,
    terminalColors = true,
    colors = { theme = { dark = {}, light = {} }, palette = {} },
    ---@type fun(colors: BackpackColorsSpec): table<string, table>
    overrides = function()
        return {}
    end,
    ---@type { dark: string, light: string }
    background = { dark = "wave", light = "lotus" },
    theme = "wave",
    compile = false,
}

local function check_config(config)
    local err
    return not err
end

--- update global configuration with user settings
---@param config? BackpackConfig user configuration
function M.setup(config)
    if check_config(config) then
        M.config = vim.tbl_deep_extend("force", M.config, config or {})
    else
        vim.notify("Backpack: Errors found while loading user config. Using default config.", vim.log.levels.ERROR)
    end
end

--- load the colorscheme
---@param theme? string
function M.load(theme)
    local utils = require("backpack.utils")

    theme = theme or M.config.background[vim.o.background] or M.config.theme
    M._CURRENT_THEME = theme

    if vim.g.colors_name then
        vim.cmd("hi clear")
    end

    vim.g.colors_name = "backpack"
    vim.o.termguicolors = true

    if M.config.compile then
        if utils.load_compiled(theme) then
            return
        end

        M.compile()
        utils.load_compiled(theme)
    else
        local colors = require("backpack.colors").setup({ theme = theme, colors = M.config.colors })
        local highlights = require("backpack.highlights").setup(colors, M.config)
        require("backpack.highlights").highlight(highlights, M.config.terminalColors and colors.theme.term or {})
    end
end

function M.compile()
    for theme, _ in pairs(require("backpack.themes")) do
        local colors = require("backpack.colors").setup({ theme = theme, colors = M.config.colors })
        local highlights = require("backpack.highlights").setup(colors, M.config)
        require("backpack.utils").compile(theme, highlights, M.config.terminalColors and colors.theme.term or {})
    end
end

vim.api.nvim_create_user_command("BackpackCompile", function()
    for mod, _ in pairs(package.loaded) do
        if mod:match("^backpack%.") then
            package.loaded[mod] = nil
        end
    end
    M.compile()
    vim.notify("Backpack: compiled successfully!", vim.log.levels.INFO)
    M.load(M._CURRENT_THEME)
    vim.api.nvim_exec_autocmds("ColorScheme", { modeline = false })
end, {})

return M
