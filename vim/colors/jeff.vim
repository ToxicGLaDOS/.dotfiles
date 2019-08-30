" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Jeff Smith <toxicglados@gmail.com>
" Last Change:	2019 July 17

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "jeff"
hi Normal                                       ctermfg=LightGrey                                            guifg=cyan	    guibg=black
hi Comment	term=bold                       ctermfg=DarkGreen                                            guifg=#80a0ff
hi Constant	term=underline	                ctermfg=Yellow  	                                     guifg=Magenta
hi Special	term=bold	                ctermfg=LightGreen 	                                     guifg=Red
hi Identifier   term=underline  cterm=bold	ctermfg=Cyan                                                 guifg=#40ffff
hi Statement    term=bold	                ctermfg=DarkCyan                        gui=bold             guifg=#aa4444
hi PreProc	term=underline	                ctermfg=DarkBlue	                                     guifg=#ff80ff
hi Type	        term=underline	                ctermfg=Grey                            gui=bold             guifg=#60ff60
hi Function	term=bold	                ctermfg=White                                                guifg=White
hi Repeat	term=underline	                ctermfg=Red	        	                             guifg=white
hi Operator				        ctermfg=DarkYellow                                           guifg=Red
hi Ignore				        ctermfg=Black		                                     guifg=bg
hi Error	term=reverse                    ctermfg=White           ctermbg=Red                          guifg=White     guibg=Red
hi Todo	        term=standout                   ctermfg=Black           ctermbg=White                        guifg=Blue      guibg=Yellow

" Common groups that link to default highlighting.
" You can specify other highlighting easily.
hi link String	        Constant
hi link Character	Constant
hi link Number	        Constant
hi link Boolean	        Constant
hi link Float		Number
hi link Conditional	Repeat
hi link Label		Statement
hi link Keyword	        Statement
hi link Exception	Statement
hi link Include	        PreProc
hi link Define	        PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef	        Type
hi link Tag		Special
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment  Special
hi link Debug		Special
