vim9script

# Name:     Eclipse vim colorscheme
# Author:   Fedor Korolev <thiranger@yandex.ru>
# License:  ?                                                               TODO
# Created:  15 Oct 2022                                                     TODO
# Modified: ?                                                               TODO

# palette
# hex       nearest256  analog16    description
#
# ffffff    231         15          white
# 000000    16          0           black
# e8f2fe    195         14          current line selection
# b0b4b9    249         7           max sym in line margin
# 3584e4    68          12          visual selection
#
# 787878    243         8           lines counter text
# 3f7f5f    65          8           comments
# 7f0055    89          5           keywords (bold)
# 2a00ff    21          12          string literals
# 005032    29          6           return/argument/std:: types             TODO
#
# c++
# 642880    54          5           endl fabs stuff                         TODO
# 0000c0    20/19       12          fields in ctor/init/getting             TODO
#
# java
# 6a3e3e    95          1           java variable                           TODO
# 0000c0    20/19       12          java output object (bold, italic)       TODO

# bold function names + operator<< is a function over a reserved keyword    TODO

hi clear
set background=light

if exists('syntax_on')
    syntax reset
endif
var colors_name = 'eclipse'

hi Normal       term=NONE ctermfg=16   ctermbg=231  cterm=NONE guifg=#000000 guibg=#ffffff gui=NONE
hi CursorLine   term=NONE ctermfg=NONE ctermbg=195  cterm=NONE guifg=NONE    guibg=#e8f2fe gui=NONE
hi ColorColumn  term=NONE ctermfg=NONE ctermbg=249  cterm=NONE guifg=NONE    guibg=#b0b4b9 gui=NONE
hi Visual       term=NONE ctermfg=231  ctermbg=68   cterm=NONE guifg=#ffffff guibg=#3584e4 gui=NONE

hi LineNr       term=NONE ctermfg=243  ctermbg=231  cterm=NONE guifg=#787878 guibg=#ffffff gui=NONE
hi CursorLineNr term=NONE ctermfg=243  ctermbg=NONE cterm=NONE guifg=#787878 guibg=NONE    gui=NONE

hi Comment      term=NONE ctermfg=65   ctermbg=NONE cterm=NONE guifg=#3f7f5f guibg=NONE    gui=NONE

hi Boolean      term=bold ctermfg=89   ctermbg=NONE cterm=bold guifg=#7f0055 guibg=NONE    gui=bold
hi Constant     term=bold ctermfg=89   ctermbg=NONE cterm=bold guifg=#7f0055 guibg=NONE    gui=bold
hi Statement    term=bold ctermfg=89   ctermbg=NONE cterm=bold guifg=#7f0055 guibg=NONE    gui=bold
hi Type         term=bold ctermfg=89   ctermbg=NONE cterm=bold guifg=#7f0055 guibg=NONE    gui=bold
hi link Include     Boolean
hi link Structure   Boolean

hi Character    term=NONE ctermfg=21   ctermbg=NONE cterm=NONE guifg=#2a00ff guibg=NONE    gui=NONE
hi link SpecialChar Character
hi link String      Character

hi Number       term=NONE ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE    guibg=NONE    gui=NONE
