--TODO:
--PreProc needs its own color
--

--parameter and field should be different
---@class SyntaxElements
---@field string ColorSpec
---@field variable ColorSpec
---@field number ColorSpec
---@field constant ColorSpec
---@field identifier ColorSpec
---@field parameter ColorSpec
---@field fun ColorSpec
---@field statement ColorSpec
---@field keyword ColorSpec
---@field operator ColorSpec
---@field none ColorSpec
---@field preproc ColorSpec
---@field opkeyword ColorSpec
---@field type ColorSpec
---@field regex ColorSpec
---@field deprecated ColorSpec
---@field null ColorSpec
---@field comment ColorSpec
---@field punct ColorSpec
---@field special1 ColorSpec
---@field special2 ColorSpec
---@field special3 ColorSpec
---@field special4 ColorSpec

---@class DiagnosticsElements
---@field error ColorSpec
---@field ok ColorSpec
---@field warning ColorSpec
---@field info ColorSpec
---@field hint ColorSpec
--
---@class DiffElements
---@field add ColorSpec
---@field delete ColorSpec
---@field change ColorSpec
---@field text ColorSpec

---@class VCSElements
---@field added ColorSpec
---@field removed ColorSpec
---@field changed ColorSpec

---@class UiElements
---@field fg ColorSpec Default foreground
---@field fg_dim ColorSpec Dimmed foreground
---@field fg_bright ColorSpec Bright foreground
---@field fg_reverse ColorSpec
---@field Cursor ColorSpec
---@field bg_dim ColorSpec Dimmed background
---@field fg_m1 ColorSpec Dimmed background
---@field bg_m4 ColorSpec
---@field bg_m5 ColorSpec
---@field bg_m6 ColorSpec
---@field bg_m7 ColorSpec
---@field bg_m3 ColorSpec
---@field bg_m2 ColorSpec
---@field bg_m1 ColorSpec
---@field bg ColorSpec Default background
---@field bg_p1 ColorSpec Lighter background ColorColumn, Folded, Gutter
---@field bg_p2 ColorSpec Lighter background Cursor{Line,Column}, TabLineSel (Selected Items)
---@field bg_gutter ColorSpec {Sign,Fold}Column, LineNr
---@field special ColorSpec SpecialKey
---@field nontext ColorSpec LineNr, NonText
---@field whitespace ColorSpec Whitespace
---@field bg_search ColorSpec
---@field bg_visual ColorSpec
---@field pmenu MenuElements
---@field float FloatElements

---@class FloatElements
---@field fg ColorSpec
---@field bg ColorSpec
---@field fg_border ColorSpec
---@field bg_border ColorSpec

---@class MenuElements
---@field bg ColorSpec
---@field fg ColorSpec
---@field fg_sel ColorSpec
---@field bg_sel ColorSpec
---@field bg_sbar ColorSpec
---@field bg_thumb ColorSpec

---@class ThemeColors
---@field syn SyntaxElements
---@field diag DiagnosticsElements
---@field vcs VCSElements
---@field diff DiffElements
---@field ui UiElements
---@field term ColorSpec[]

return {
  ---@param palette PaletteColors
  ---@return ThemeColors
  dark = function(palette)
    return {
      ui = {
        fg         = palette.light1,
        fg_dim     = palette.light2,
        fg_bright  = palette.light4,
        fg_reverse = palette.extra_light_blue,

        bg_dim     = palette.dark0_hard,
        bg_gutter  = palette.background,

        bg_m7      = palette.dark12,
        bg_m6      = palette.dark10,
        bg_m5      = palette.dark7,
        bg_m4      = palette.dark4,
        bg_m3      = palette.dark3,
        bg_m2      = palette.dark2,
        bg_m1      = palette.dark1,
        fg_m1      = palette.light4,
        bg         = palette.background,
        bg_p1      = palette.dark4,
        bg_p2      = palette.dark5,

        special    = palette.baby_blue,
        nontext    = palette.dark4,
        whitespace = palette.background,
        cursor     = palette.dark8,

        bg_search  = palette.dark0,
        bg_visual  = palette.dark3,

        pmenu = {
          fg       = palette.light1,
          fg_sel   = "none", -- This is important to make highlights pass-through
          bg       = palette.background,
          bg_sel   = palette.forest_blue,
          bg_sbar  = palette.dark2,
          bg_thumb = palette.dark4,
        },
        float      = {
            fg        = palette.bright_purple,
            bg        = palette.background,
            fg_border = palette.light1,
            bg_border = palette.background,
        },
      },
      syn = {
          string     = palette.bright_purple,
          variable   = "none",
          number     = palette.bright_purple,
          constant   = palette.extra_light_blue,
          identifier = palette.light2,
          -- parameter  = "#C3B1B1",
          -- parameter  = "#B1ADC8",
          -- parameter  = "#b8b4d0",
          parameter  = palette.light1,
          -- parameter = "#d5a4a6",
          -- parameter  = "#C8ADAD",
          -- parameter  = "#d7a8a8",
          fun        = palette.extra_light_blue,
          statement  = palette.stain_yellow,
          keyword    = palette.light1,
          operator   = palette.light1,
          preproc    = palette.bright_neon_blue,
          opkeyword  = palette.bright_red,
          type       = palette.green,
          regex      = palette.bright_purple,
          deprecated = palette.forest_blue,
          null       = palette.dark_red,
          none       = palette.terminal_blue,
          comment    = palette.gray_244,
          punct      = palette.gray_244,
          special1   = palette.light12,
          special2   = palette.light11,
          special3   = palette.rose,
          special4   = palette.light8,
      },
      vcs = {
          added   = palette.green,
          removed = palette.forest_blue,
          changed = palette.bright_red,
      },
      diff = {
          add    = palette.green,
          delete = palette.dark_red,
          change = palette.forest_blue,
          text   = palette.light1,
      },
      diag = {
          ok      = palette.green,
          error   = palette.dark_red,
          warning = palette.stain_yellow,
          info    = palette.light3,
          hint    = palette.terminal_blue,
      },
      term = {
          palette.dark0_harder, -- black
          palette.dark_red, -- red
          palette.green, -- green
          palette.stain_yellow, -- yellow
          palette.baby_blue, -- blue
          palette.bright_purple, -- magenta
          palette.bright_neon_blue, -- cyan
          palette.light1, -- white
          palette.gray_244, -- bright black
          palette.bright_red, -- bright red
          palette.terminal_green, -- bright green
          palette.terminal_blue, -- bright blue 
          palette.dark_extra_light_blue, -- bright blue
          palette.rose, -- bright magenta
          palette.bright_neon_blue, -- bright cyan
          palette.light0, -- bright white
          palette.rose, -- extended color 1
          palette.dark_stain_yellow, -- extended color 2
      }
    }
  end,

  light = function(palette)
    return {
      ui = {
        fg         = palette.dark1,
        fg_dim     = palette.dark2,
        fg_bright  = palette.dark4,
        fg_reverse = palette.extra_dark_blue,

        bg_dim     = palette.light0_hard,
        bg_gutter  = palette.background,

        bg_m7      = palette.light9,
        bg_m6      = palette.light10,
        bg_m5      = palette.light9,
        bg_m4      = palette.light4,
        bg_m3      = palette.light3,
        bg_m2      = palette.light2,
        bg_m1      = palette.light1,
        fg_m1      = palette.dark4,
        bg         = palette.background,
        bg_p1      = palette.light4,
        bg_p2      = palette.light5,

        special    = palette.baby_blue,
        nontext    = palette.light4,
        whitespace = palette.background,
        cursor     = palette.light8,

        bg_search  = palette.light0,
        bg_visual  = palette.light3,

        pmenu = {
          fg       = palette.dark1,
          fg_sel   = "none", -- This is important to make highdarks pass-through
          bg       = palette.background,
          bg_sel   = palette.forest_blue,
          bg_sbar  = palette.light2,
          bg_thumb = palette.light4,
        },
        float      = {
            fg        = palette.bright_purple,
            bg        = palette.background,
            fg_border = palette.dark1,
            bg_border = palette.background,
        },
      },
      syn = {
          string     = palette.bright_purple,
          variable   = "none",
          number     = palette.bright_purple,
          constant   = palette.extra_dark_blue,
          identifier = palette.dark2,
          -- parameter  = "#C3B1B1",
          -- parameter  = "#B1ADC8",
          -- parameter  = "#b8b4d0",
          parameter  = palette.dark1,
          -- parameter = "#d5a4a6",
          -- parameter  = "#C8ADAD",
          -- parameter  = "#d7a8a8",
          fun        = palette.extra_dark_blue,
          statement  = palette.stain_yellow,
          keyword    = palette.dark1,
          operator   = palette.dark1,
          preproc    = palette.bright_neon_blue,
          opkeyword  = palette.bright_red,
          type       = palette.green,
          regex      = palette.bright_purple,
          deprecated = palette.forest_blue,
          null       = palette.dark_red,
          none       = palette.terminal_blue,
          comment    = palette.gray_244,
          punct      = palette.gray_244,
          special1   = palette.dark12,
          special2   = palette.dark11,
          special3   = palette.rose,
          special4   = palette.dark8,
      },
      vcs = {
          added   = palette.green,
          removed = palette.forest_blue,
          changed = palette.bright_red,
      },
      diff = {
          add    = palette.green,
          delete = palette.dark_red,
          change = palette.forest_blue,
          text   = palette.light4,
      },
      diag = {
          ok      = palette.green,
          error   = palette.dark_red,
          warning = palette.stain_yellow,
          info    = palette.dark3,
          hint    = palette.terminal_blue,
      },
      term = {
          palette.light0_harder, -- black
          palette.dark_red, -- red
          palette.green, -- green
          palette.stain_yellow, -- yellow
          palette.baby_blue, -- blue
          palette.bright_purple, -- magenta
          palette.bright_neon_blue, -- cyan
          palette.dark1, -- white
          palette.gray_244, -- bright black
          palette.bright_red, -- bright red
          palette.terminal_green, -- bright green
          palette.terminal_blue, -- bright blue
          palette.extra_dark_blue, -- dark blue
          palette.rose, -- bright magenta
          palette.bright_neon_blue, -- bright cyan
          palette.dark0, -- bright white
          palette.rose, -- extended color 1
          palette.light_stain_yellow, -- extended color 2
      }
    }
  end,
}
