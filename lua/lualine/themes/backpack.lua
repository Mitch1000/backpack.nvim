local vim = vim
local theme = require("backpack.colors").setup().theme

local backpack = {}

backpack.normal = {
  a = { bg = theme.syn.deprecated, fg = theme.ui.bg_m4, gui = 'bold' },
  b = { bg = theme.ui.bg_m4, fg = theme.syn.deprecated },
  c = { bg = theme.ui.bg, fg = theme.syn.special1 },
  x = { bg = theme.ui.bg_m4, fg = theme.syn.special2 },
  y = { bg = theme.ui.bg_m4, fg = theme.syn.special2 },
  z = { bg = theme.syn.deprecated, fg = theme.ui.bg_m4, gui = 'bold'},
}

backpack.insert = {
  a = { bg = theme.syn.string, fg = theme.ui.bg, gui = 'bold' },
  b = { bg = theme.ui.bg_m4, fg = theme.syn.special2 },
  c = { bg = theme.ui.bg, fg = theme.syn.special1 },
}

backpack.command = {
  a = { bg = theme.ui.fg, fg = theme.ui.bg, gui = 'bold' },
  b = { bg = theme.ui.bg, fg = theme.ui.fg },
  c = { bg = theme.ui.bg, fg = theme.syn.special2 },
}

backpack.visual = {
  a = { bg = theme.syn.identifier, fg = theme.ui.bg, gui = 'bold' },
  b = { bg = theme.ui.bg, fg = theme.syn.special2 },
  c = { bg = theme.ui.bg, fg = theme.syn.special2 },
}

backpack.replace = {
  a = { bg = theme.syn.constant, fg = theme.ui.bg, gui = 'bold' },
  b = { bg = theme.ui.bg, fg = theme.syn.constant },
  c = { bg = theme.ui.bg_m4, fg = theme.syn.special2 },
}

backpack.inactive = {
  a = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim, gui = 'bold' },
  b = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim, gui = "bold" },
  c = { bg = theme.ui.bg_m4, fg = theme.syn.special2 },
}

if vim.g.backpack_lualine_bold then
  for _, mode in pairs(backpack) do
    mode.a.gui = "bold"
  end
end

return backpack
