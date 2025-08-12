local vim = vim
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
  dark6 = {'#1e1e1e', 234},
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
  light6 = {'#fcfcfc', 246},
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

local function get_background(theme, contrast)
  local theme_contrast_values = {
    dark = { high = palette.dark6, extreme = palette.dark11, medium = palette.background },
    light = { high = palette.light10, extreme = palette.light10, medium = palette.light6 }
  }

  return theme_contrast_values[theme][contrast] or theme_contrast_values[theme]["medium"]
end

local M = {}

--- Clamp
--- @param component number
--- @return number
local function clamp(component)
  return math.min(math.max(component, 0), 255)
end

--- Adjust color lightness
--- @param color string
--- @param amt number
--- @return string
local function adjust_color_lightness(color, amt)
  if type(color) ~= 'string' then
    return color
  end
  local col = string.gsub(color, "#", "0x")
  local num = tonumber(col, 16)
  local r = clamp(math.floor(num / 0x10000) - amt)
  local g = clamp((math.floor(num / 0x100) % 0x100) - amt)
  local b = clamp((num % 0x100) - amt)

  local rs = string.format("%#x", r * 0x10000)
  if rs == "0" then rs = "0x00" end
  local gs = string.format("%#x", g * 0x100)
  if gs == "0" then gs = "0x00" end
  local bs = string.format("%#x", b)
  if bs == "0" then bs = "0x00" end

  local start = 3
  local strend = 4
  local red = string.sub(rs, start, strend)
  local green = string.sub(gs, start, strend)
  local blue = string.sub(bs, start, strend)

  return [[#]] .. red .. green .. blue
end

--- Darken Light Theme Colors:
--- For darkening light theme colors to improve contrast
--- @param color_modifier number
local function darken_lighttheme_colors(color_modifier)
    palette.bright_purple = adjust_color_lightness(palette.bright_purple, 50 * color_modifier)
    palette.stain_yellow = adjust_color_lightness(palette.stain_yellow, 30 * color_modifier)
    palette.extra_dark_blue = palette.dark10
    palette.forest_blue = adjust_color_lightness(palette.forest_blue, 30 * color_modifier)
    palette.green = adjust_color_lightness(palette.green, 25 * color_modifier)
    palette.bright_neon_blue = adjust_color_lightness(palette.bright_neon_blue, 30 * color_modifier)
    palette.baby_blue = adjust_color_lightness(palette.baby_blue, 100 * color_modifier)
    palette.extra_light_blue = adjust_color_lightness(palette.extra_light_blue, 10 * color_modifier)
end

--- Generate colors table:
--- * opts:
---   - colors: Table of personalized colors and/or overrides of existing ones.
---     Defaults to BackpackConfig.colors.
---   - theme: Use selected theme. Defaults to BackpackConfig.theme
---     according to the value of 'background' option.
---@param opts? { colors?: table, theme?: string, contrast?: string }
---@return { theme: ThemeColors, palette: PaletteColors}
function M.setup(opts)
    opts = opts or {}
    local override_colors = opts.colors or require("backpack").config.colors
    local theme = opts.theme or require("backpack")._CURRENT_THEME -- WARN: this fails if called before backpack.load()

    if not theme then
        error("backpack.colors.setup(): Unable to infer `theme`. Either specify a theme or call this function after ':colorscheme backpack'")
    end

    local contrast = opts.contrast
    if theme == "light" then
      local mod = contrast == "extreme" and 1.5 or 1
      darken_lighttheme_colors(mod)
    end

    if theme == "dark" and contrast == "extreme" then
      palette.dark7 = adjust_color_lightness(palette.dark7, 50)
    end

    palette.background = get_background(theme, contrast)

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

