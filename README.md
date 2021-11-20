![Olivia](https://olivia-theme.github.io/images/logo.png)

### [Olivia Theme](https://olivia-theme.github.io/) for VIM

To enable this color scheme, set it in your vimrc:
```
colorscheme olivia
```

### Terminal True Color Support ###
  Add this to your .vimrc to enable true colors:
```
if has('nvim') || has('termguicolors')
  set termguicolors
endif
```

### Installation

#### vim-plug ###
```
Plug 'olivia-theme/vim', { 'as': 'olivia' }
```
#### vundle ###
```
Plugin 'olivia-theme/vim', {'name': 'olivia-theme'}
```

### Screenshot ###

![Screenshot](https://olivia-theme.github.io/images/screenshots/vim.png)

### Options ###
  * **g:olivia_termcolors**
    This options sets the terminal colors to 16 or 256 Colors. Default value is 256.
    If it is set to 16 ,this colorscheme will attempt to use the standard 16 colors of your terminal emulator and background color will be the default background color of your terminal emulator.
    For the best colors in terminal, its recommended to set set your terminalcolors to [Olivia Terminal Colors](#olivia-terminal-colors) and use 16 colors.


### Olivia Terminal Colors ###
```
! ~/.Xresource
*.foreground:   #cbe3e7
*.background:   #1e1c31
*.cursorColor:  #fbfcfc

! black
*.color0:       #565575
*.color8:       #100e23

! red
*.color1:       #ff8080
*.color9:       #ff5458

! green
*.color2:       #95ffa4
*.color10:      #62d196

! yellow
*.color3:       #ffe9aa
*.color11:      #ffb378

! blue
*.color4:       #91ddff
*.color12:      #65b2ff

! magenta
*.color5:       #c991e1
*.color13:      #906cff

! cyan
*.color6:       #aaffe4
*.color14:      #63f2f1

! white
*.color7:       #cbe3e7
*.color15:      #a6b3cc
```

### Lightline Theme ###

![Lightline](https://olivia-theme.github.io/images/screenshots/vim-lightline.png)

Olivia supports [lightline.vim](https://github.com/itchyny/lightline.vim). To enable the colorscheme,
add one of the following lines to your `.vimrc`:

``` viml
let g:lightline = { 'colorscheme': 'olivia'}
```

### Lualine Theme ###

Olivia also supports [lualine.vim](https://github.com/nvim-lualine/lualine.nvim). To enable the colorscheme,
add the following lines to your `init.lua`:

```lua
require'lualine'.setup {
  options = { theme = 'olivia' }
}
```

### Troubleshooting ###
 If you are running vim inside tmux with the alacritty terminal, make sure to set `default-terminal` to `xterm-256color` in your tmux config (see [this issue](https://github.com/olivia-theme/vim/issues/18) for more details:
 
```text
# ... 
set-option -g default-terminal "xterm-256color"
# ...
```
