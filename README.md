# Backpack - A Vim Color Scheme

Backpack is simple vim and neovim color scheme heavily inspired by [gruvbox](https://github.com/morhetz/gruvbox), and the Iterm2 color theme [Neutron](https://github.com/mbadolato/iTerm2-Color-Schemes)

A simple Retro theme.

Feedback is appreciated!

Typeface from screenshots below is [Monaco Nerd Font](https://github.com/Karmenzind/monaco-nerd-fonts)

<img width="1064" height="701" style= "width: 50%;" alt="Screenshot 2025-07-20 at 11 36 29 AM" src="https://github.com/user-attachments/assets/ddf703b9-c397-45b1-8a57-fa057feb13f0" />

Palette
-------------

![Palette](https://github.com/user-attachments/assets/c737ef18-8237-48ca-b787-255f058dee48)

Dark mode
-------------

<img width="1781" alt="Screen Shot 2022-04-27 at 11 24 28 AM" src="https://user-images.githubusercontent.com/19654528/165554966-64e02997-4993-4024-868d-a3ba8c7d0d52.png">

<img width="1777" alt="Screen Shot 2022-05-03 at 2 08 48 PM" src="https://user-images.githubusercontent.com/19654528/166515689-82583677-f347-456f-8d7b-7d6d675ded71.png">

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
      background = { dark = "dark", light = "light" },
      overrides = function()
          return {}
      end,
    })
  end
```

### 256 Color Support!

To use 256 colors use `vim.cmd([[ set notermguicolors ]])` after the color scheme has loaded.
