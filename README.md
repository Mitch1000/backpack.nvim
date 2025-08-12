# Backpack - A Neovim Color Scheme

A simple Retro theme.

Backpack.nvim is a simple Neovim high-contrast colour scheme heavily inspired by [gruvbox](https://github.com/morhetz/gruvbox), and the Iterm2 color theme [Neutron](https://github.com/mbadolato/iTerm2-Color-Schemes)

Typeface from screenshots below is [EnvyCodeR Nerd Font Mono](https://www.nerdfonts.com/font-downloads)

<img width="1064" height="701" style= "width: 70%;" alt="Screenshot 2025-07-20 at 11 36 29 AM" src="https://github.com/user-attachments/assets/ddf703b9-c397-45b1-8a57-fa057feb13f0" />

Palette
-------------

![Palette](https://github.com/user-attachments/assets/c737ef18-8237-48ca-b787-255f058dee48)

Dark mode
-------------
<img width="990" height="566" alt="Screenshot 2025-07-28 at 8 16 19 PM" src="https://github.com/user-attachments/assets/fb2efd62-7bb2-4408-af66-90aaf5a46dd0" />

Light mode
-------------
<img width="992" height="561" alt="Screenshot 2025-07-28 at 9 17 58 PM" src="https://github.com/user-attachments/assets/56c5bc9e-2802-4862-aabf-d90dae018479" />

Installation Method
-------------

    Dein
        Add the following to your .vimrc, and run call dein#install():

    call dein#add('Mitch1000/backpack')

    Packer
        use {'mitch1000/backpack' }

    Lazy
        {
          'mitch1000/backpack',
          config = function ()
            require('backpack').setup()
          end
        },

Then add `colorscheme backpack` to your `vimrc` file.

OR

```lua
 vim.g.my_color_scheme = 'backpack'
 vim.cmd('colorscheme ' .. vim.g.my_color_scheme)
```

to your `init.lua` file.

### Options

NOTE: If you are using iTerm2, you may want to use the sRGB color space for more accurate color reproduction. 
There is an option to disable P3 colors in the Advanced Settings tab.

```lua
  config = function ()
    require('backpack').setup({
      undercurl = false,
      commentStyle = { italic = true },
      compile = false,
      functionStyle = {},
      keywordStyle = { bold = true },
      statementStyle = { bold = true },
      returnStyle = { italic = false, bold = true },
      typeStyle = {},
      transparent = false,
      dimInactive = false,
      terminalColors = true,
      colors = { theme = { dark = {}, light = {} }, palette = {} },
      contrast = "medium", -- medium, high, extreme
      overrides = function()
          return {}
      end,
    })
  end
```
#### Change Contrast

<img width="1064" height="701" style= "width: 60%;" alt="Screenshot 2025-07-20 at 11 36 29 AM" src="https://github.com/user-attachments/assets/d54e9e77-8c09-4249-9496-ba5eac926e61" />

### 256 Color Support!

To use 256 colors use `vim.cmd([[ set notermguicolors ]])` after the color scheme has loaded.

#### Thanks!!

Thanks to [Kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim). Most of the code in this repo has been taken from there and repurposed.

Feedback is appreciated!
