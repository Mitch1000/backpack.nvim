---@class PaletteColors
local full_palette = {
  background = {'#222222', 235},
  bg_popup = {'#212121', 235},
  dark0_hard = {'#1b1b1b', 234},
  dark0_harder = {'#0e0e0e', 234},
  dark0 = {'#222222', 235},
  dark0_soft = {'#303030', 236},
  dark1 = {'#3a3a3a', 237},
  dark2 = {'#4d4d4d', 239},
  dark3 = {'#5f5f5f', 241},
  dark4 = {'#757575', 243},
  dark5 = {'#444444', 238},
  dark6 = {'#6f6f6f', 241},
  dark7 = {'#181818', 234},
  dark8 = {'#303030', 236},
  dark9 = {'#212121', 235},
  dark10 = {'#1b1b1b', 234},
  dark11 = {'#121212', 233},
  dark12 = {'#262626', 233},
  dark4_256 = {'#757575', 243},
  gray_246 = {'#949494', 246},
  gray_245 = {'#8a8a8a', 245},
  gray_244 = {'#808080', 244},
  light0_hard = {'#f8eff7', 231},
  light0 = {'#eeeeee', 255},
  light0_soft = {'#fee1fb', 254},
  light1 = {'#f7f0f6', 255},
  light2 = {'#f8eff7', 254},
  light3 = {'#dadada', 253},
  light4 = {'#d0d0d0', 252},
  light5 = {'#b2b2b2', 249},
  light6 = {'#949494', 246},
  light7 = {'#fafafa', 253},
  light8 = {'#c2c2c2', 251},
  light9 = {'#eeeeee', 255},
  light10 = {'#ffffff', 231},
  light11 = {'#f0f0f0', 231},
  light12 = {'#f1e5f0', 231},
  light4_256 = {'#eeeeee', 255},
  stain_yellow = {'#d6a477', 180},
  dark_gray = {'#252525', 235},
  green = {'#2cf392', 85},
  dark_red = {'#bb595c', 131},
  bright_red = {'#e7477e', 168},
  error_red = {'#ff0000', 9},
  forest_blue = {'#31a6a5', 73},
  bright_purple = {'#b581b0', 139},
  bright_neon_blue = {'#00d4f8', 81},
  baby_blue = {'#94ffff', 159},
  extra_light_blue = {'#ccffff', 195},
  rose = {'#ffd5d6', 224},
  soft_pink = {'#f7eaf5', 225},
  dark_stain_yellow = {'#bf0060', 125},
  dark_dark_gray = {'#1b1b1b', 234},
  dark_green = {'#0089ff', 33},
  terminal_green = {'#96ba92', 115},
  terminal_blue = {'#b8cfe6', 153},
  dark_dark_red = {'#bb595c', 131},
  dark_bright_red = {'#e75487', 168},
  dark_forest_blue = {'#eb0089', 162},
  dark_bright_purple = {'#6800b6', 55},
  dark_bright_neon_blue = {'#0089ff', 33},
  dark_baby_blue = {'#e482ff', 177},
  dark_extra_light_blue = {'#444444', 238},
  dark_rose = {'#ff7eda', 212},
}

local palette  = {}
for k, v in pairs(full_palette) do
  palette[k] = v[1]
end


local M = {}
--- Generate colors table:
--- * opts:
---   - colors: Table of personalized colors and/or overrides of existing ones.
---     Defaults to BackpackConfig.colors.
---   - theme: Use selected theme. Defaults to BackpackConfig.theme
---     according to the value of 'background' option.
---@param opts? { colors?: table, theme?: string }
---@return { theme: ThemeColors, palette: PaletteColors}
function M.setup(opts)
    opts = opts or {}
    local override_colors = opts.colors or require("backpack").config.colors
    local theme = opts.theme or require("backpack")._CURRENT_THEME -- WARN: this fails if called before backpack.load()

    if not theme then
        error("backpack.colors.setup(): Unable to infer `theme`. Either specify a theme or call this function after ':colorscheme backpack'")
    end

  if theme == "light" then
    palette.background = palette.light7
  end

  local updated_palette_colors = vim.tbl_extend("force", palette, override_colors.palette or {})

    -- Generate the theme according to the updated palette colors
    local theme_colors = require("backpack.themes")[theme](updated_palette_colors)

    -- Add to and/or override theme_colors
    local theme_overrides = vim.tbl_deep_extend("force", override_colors.theme["all"] or {}, override_colors.theme[theme] or {} )
    local updated_theme_colors = vim.tbl_deep_extend("force", theme_colors, theme_overrides)
    -- return palette_colors AND theme_colors

    return {
        theme = updated_theme_colors,
        palette = updated_palette_colors,
    }
end

return M

