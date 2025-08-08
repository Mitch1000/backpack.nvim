local M = {}
local vim = vim
---@alias ColorSpec string RGB Hex string
---@alias ColorTable table<string, ColorSpec>
---@alias BackpackColorsSpec { palette: ColorTable, theme: ColorTable }
---@alias BackpackColors { palette: PaletteColors, theme: ThemeColors }

local is_default_theme = true

--- default config
---@class BackpackConfig
---
local default_config = {
    undercurl = false,
    -- TODO: Remove vim_ setting values
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
    theme = "dark",
    contrast = "medium",
    compile = false,
}

local current_config = default_config

local function check_config(config)
    local err
    for k in pairs(config) do
      if default_config[k] ~= nil then
        local default_type = type(default_config[k])
        local v = config[k]
        if type(v) ~= default_type then
          err = [[Config value: "]] .. tostring(k) .. [[" must be of type: "]] .. default_type .. [[".]]
          return err
        end
      end
    end
    return err
end

--- update global configuration with user settings
---@param config? BackpackConfig user configuration
function M.setup(config)
    if type(config) ~= 'table' then return end

    local error = check_config(config)
    if not error then
        current_config = vim.tbl_deep_extend("force", default_config, config or {})
        if config.theme ~= nil then
          is_default_theme = false
        end
    else
        vim.notify("Backpack: Errors found while loading user config. Using default config. " .. error, vim.log.levels.ERROR)
    end
end

--- load the colorscheme
---@param theme? string
function M.load(theme)
    local utils = require("backpack.utils")

    theme = theme or current_config.theme or vim.o.background
    if is_default_theme then
      theme = vim.o.background or current_config.theme
    end

    M._CURRENT_THEME = theme

    if vim.g.colors_name then
        vim.cmd("hi clear")
    end

    vim.g.colors_name = "backpack"
    vim.o.termguicolors = true

    if current_config.compile then
        if utils.load_compiled(theme) then
            return
        end

        M.compile()
        utils.load_compiled(theme)
    else
        local colors = require("backpack.colors").setup({
          theme = theme,
          colors = current_config.colors,
          contrast = current_config.contrast,
        })
        local highlights = require("backpack.highlights").setup(colors, current_config)
        require("backpack.highlights").highlight(highlights, current_config.terminalColors and colors.theme.term or {})
    end
end

function M.compile()
    for theme, _ in pairs(require("backpack.themes")) do
        local colors = require("backpack.colors").setup({
          theme = theme,
          colors = current_config.colors,
          contrast = current_config.contrast,
        })
        local highlights = require("backpack.highlights").setup(colors, current_config)
        require("backpack.utils").compile(theme, highlights, current_config.terminalColors and colors.theme.term or {})
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

M.config = current_config

return M
