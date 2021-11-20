" Vim Color File
" Name:       olivia.vim
" Version:    1.0
" Maintainer: github.com/daveyholler
" License:    The MIT License (MIT)
" Based On: pencil by github.com/reedes and github.com/mattly

hi clear

if exists('syntax on')
    syntax reset
endif

let g:colors_name='olivia'
set background=dark


if ! exists("g:olivia_termcolors")
  let g:olivia_termcolors = 256
endif

" not all terminals support italics properly.  If yours does, opt-in.
if ! exists("g:olivia_terminal_italics")
  let g:olivia_terminal_italics = 0
endif

" Colors
let s:black           = { "gui": "#212121", "cterm": "0", "cterm16" : "8" }
let s:medium_gray     = { "gui": "#767676", "cterm": "243", "cterm16" : "243" }
let s:white           = { "gui": "#F3F3F3", "cterm": "15", "cterm16" : "15" }
let s:actual_white    = { "gui": "#FFFFFF", "cterm": "231", "cterm16" : "231" }
let s:light_black     = { "gui": "#424242", "cterm": "8", "cterm16" : "0" }
let s:lighter_black   = { "gui": "#545454", "cterm": "240", "cterm16" : "240" }

" lighter shadows and darker grays
let s:subtle_black  = { "gui": "#303030", "cterm": "236", "cterm16" : "236" }
let s:light_gray    = { "gui": "#B2B2B2", "cterm": "249", "cterm16" : "249" }
let s:lighter_gray  = { "gui": "#C6C6C6", "cterm": "251", "cterm16" : "251" }

" flat colors:
let s:asphalt = { "gui": "#1C1917", "cterm": "233", "cterm16": "NONE"}
let s:asphalt_subtle= { "gui": "#201711", "cterm": "232", "cterm16": "0"}
let s:dark_asphalt = { "gui": "#3B312B", "cterm": "236", "cterm16": "8"}

let s:whiskey = { "gui": "#FFE2DF", "cterm": "204", "cterm16": "1"}
let s:bourbon = { "gui": "#FAC6AE", "cterm": "203", "cterm16": "9"}

let s:portage = { "gui": "#95B6FF", "cterm": "120", "cterm16": "2"}
let s:moody_blue = { "gui": "#6362D1", "cterm": "119", "cterm16": "10"}

let s:nebula = { "gui": "#B8D7CD", "cterm": "228", "cterm16": "3"}
let s:gum_leaf = { "gui": "#9AC7A9", "cterm": "215", "cterm16": "11"}

let s:japonica = { "gui": "#D28271", "cterm": "159", "cterm16": "4"}
let s:antique_brass = { "gui": "#C98056", "cterm": "75", "cterm16": "12"}

let s:rose = { "gui": "#FFB2AA", "cterm": "141", "cterm16": "5"}
let s:froly = { "gui": "#FF7894", "cterm": "135", "cterm16": "13"}

let s:glacier = { "gui": "#95BECE", "cterm": "122", "cterm16": "6"}
let s:danube = { "gui": "#638BC3", "cterm": "121", "cterm16": "14"}

let s:clouds = { "gui": "#cbe3e7", "cterm": "253", "cterm16": "7"}
let s:dark_clouds = { "gui": "#a6b3cc", "cterm": "252", "cterm16": "15"}

let s:bg              = s:asphalt
let s:bg_subtle       = s:asphalt_subtle
let s:bg_dark         = s:dark_asphalt
let s:norm            = s:whiskey
let s:norm_subtle     = s:bourbon
let s:visual          = s:bg_dark

let s:head_a         = s:rose
let s:head_b         = s:froly
let s:head_c         = s:bourbon

" shamelessly stolen from hemisu: https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  " Not all terminals support italics properly. If yours does, opt-in.
  if g:olivia_terminal_italics == 0 && has_key(a:style, "cterm") && a:style["cterm"] == "italic"
    unlet a:style.cterm
  endif
  if g:olivia_termcolors == 16
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm16 : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm16 : "NONE")
  else
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm : "NONE")
  end
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" . l:ctermfg
    \ "ctermbg=" . l:ctermbg
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

" common groups ================================================================
" (see `:h w18`)

call s:h("Normal",        {"bg": s:bg, "fg": s:norm})
call s:h("Cursor",        {"bg": s:japonica, "fg": s:bg_dark})
call s:h("Comment",       {"fg": s:medium_gray, "gui": "italic", "cterm": "italic"})

call s:h("Constant",      {"fg": s:nebula})
hi! link String           Constant
hi! link Character        Constant

call s:h("Number",       {"fg": s:moody_blue})
hi! link Boolean          Constant
hi! link Float            Constant

call s:h("Identifier",    {"fg": s:rose})
hi! link Function         Identifier

call s:h("Label",        {"fg": s:portage})
hi! link Conditonal       Statement
hi! link Exception        Statement

call s:h("Operator",     {"fg": s:antique_brass})
hi! link Repeat           Operator

call s:h("PreProc",       {"fg": s:japonica})
hi! link Include          PreProc
hi! link Define           PreProc
hi! link Macro            PreProc
hi! link PreCondit        PreProc


call s:h("Keyword",       {"fg": s:bourbon})
hi! link Statement        Keyword

call s:h("Type",          {"fg": s:froly})
hi! link StorageClass     Type
hi! link Structure        Type
hi! link Typedef          Type

call s:h("Special",       {"fg": s:nebula})
hi! link SpecialChar      Special
hi! link Tag              Special
hi! link Delimiter        Special
hi! link SpecialComment   Special
hi! link Debug            Special

call s:h("Underlined",    {"fg": s:norm                      , "gui": "underline", "cterm": "underline"})
call s:h("Ignore",        {"fg": s:bg                                                                  })
call s:h("Error",         {"fg": s:bourbon, "bg": s:bg_subtle , "gui": "bold"     , "cterm": "bold"     })
call s:h("Todo",          {"fg": s:moody_blue, "bg": s:bg_subtle, "gui": "bold"     , "cterm": "bold"     })

" ui chrome ====================================================================
" ordered according to `:help hitest.vim`

call s:h("SpecialKey",    {"fg": s:japonica})
call s:h("Boolean",    {"fg": s:gum_leaf})
call s:h("Number",    {"fg": s:gum_leaf})
call s:h("Float",    {"fg": s:gum_leaf})
call s:h("NonText",       {"fg": s:bg_dark})
call s:h("Directory",     {"fg": s:rose})
call s:h("ErrorMsg",      {"fg": s:bourbon})
call s:h("IncSearch",     {"bg": s:whiskey, "fg": s:clouds})
call s:h("Search",        {"bg": s:bg_dark})
call s:h("MoreMsg",       {"fg": s:medium_gray, "gui": "bold", "cterm": "bold"})
hi! link ModeMsg MoreMsg
call s:h("LineNr",        {"fg": s:lighter_black, "bg": s:bg_subtle})
call s:h("CursorLineNr",  {"bg": s:bg_subtle, "fg": s:japonica, "gui": "bold"})
call s:h("Question",      {"fg": s:whiskey})
call s:h("StatusLine",    {"bg": s:bg_dark})
call s:h("Conceal",       {"fg": s:norm})
call s:h("StatusLineNC",  {"bg": s:bg_dark, "fg": s:medium_gray})
call s:h("VertSplit",     {"fg": s:bg_subtle})
call s:h("Title",         {"fg": s:antique_brass})
call s:h("Visual",        {"bg": s:visual})
call s:h("WarningMsg",    {"fg": s:nebula})
call s:h("WildMenu",      {"fg": s:bg_subtle, "bg": s:glacier})
call s:h("Folded",        {"bg": s:rose, "fg": s:bg_subtle})
call s:h("FoldColumn",    {"fg": s:nebula})
call s:h("DiffAdd",       {"fg": s:portage})
call s:h("DiffDelete",    {"fg": s:whiskey})
call s:h("DiffChange",    {"fg": s:gum_leaf})
call s:h("DiffText",      {"fg": s:antique_brass})
call s:h("SignColumn",    {"fg": s:portage})

if has("gui_running")
  call s:h("SpellBad",    {"gui": "underline", "sp": s:bourbon})
  call s:h("SpellCap",    {"gui": "underline", "sp": s:portage})
  call s:h("SpellRare",   {"gui": "underline", "sp": s:whiskey})
  call s:h("SpellLocal",  {"gui": "underline", "sp": s:moody_blue})
else
  call s:h("SpellBad",    {"cterm": "underline", "fg": s:bourbon})
  call s:h("SpellCap",    {"cterm": "underline", "fg": s:portage})
  call s:h("SpellRare",   {"cterm": "underline", "fg": s:whiskey})
  call s:h("SpellLocal",  {"cterm": "underline", "fg": s:moody_blue})
endif
call s:h("Pmenu",         {"fg": s:norm, "bg": s:bg_subtle})
call s:h("PmenuSel",      {"fg": s:norm, "bg": s:bg_dark})
call s:h("PmenuSbar",     {"fg": s:norm, "bg": s:bg_dark})
call s:h("PmenuThumb",    {"fg": s:norm, "bg": s:bg_dark})
call s:h("TabLine",       {"fg": s:norm, "bg": s:bg_dark})
call s:h("TabLineSel",    {"fg": s:norm, "bg": s:bg_subtle, "gui": "bold", "cterm": "bold"})
call s:h("TabLineFill",   {"fg": s:norm, "bg": s:bg_dark})
call s:h("CursorColumn",  {"bg": s:bg_subtle})
call s:h("CursorLine",    {"bg": s:bg_subtle})
call s:h("ColorColumn",   {"bg": s:bg_subtle})

" remainder of syntax highlighting
call s:h("MatchParen",    {"bg": s:bg_subtle, "fg": s:rose, "gui": "bold", "cterm": "bold"})
call s:h("qfLineNr",      {"fg": s:medium_gray})

" hi helpHyperTextJump guifg=#5FAFD7 ctermfg=74

" HTML syntax
hi! link htmlTag          Identifier
hi! link htmlEndTag       htmlTag

hi! link htmlTagName      Identifier
" html5 tags show up as htmlTagN
hi! link htmlTagN         Special

" HTML content
call s:h("htmlH1",        {"fg": s:head_a, "gui": "bold,italic", "cterm": "bold"     })
call s:h("htmlH2",        {"fg": s:head_a, "gui": "bold"       , "cterm": "bold"     })
call s:h("htmlH3",        {"fg": s:head_b, "gui": "italic"     , "cterm": "italic"   })
call s:h("htmlH4",        {"fg": s:head_b, "gui": "italic"     , "cterm": "italic"   })
call s:h("htmlH5",        {"fg": s:head_c                                            })
call s:h("htmlH6",        {"fg": s:head_c                                            })
call s:h("htmlLink",      {"fg": s:japonica  , "gui": "underline"  , "cterm": "underline"})
call s:h("htmlItalic",    {                "gui": "italic"     , "cterm": "italic"   })
call s:h("htmlBold",      {                "gui": "bold"       , "cterm": "bold"     })
call s:h("htmlBoldItalic",{                "gui": "bold,italic", "cterm": "bold"     })
" hi htmlString     guifg=#87875f guibg=NONE gui=NONE        ctermfg=101 ctermbg=NONE cterm=NONE

" tpope/vim-markdown
call s:h("markdownBlockquote",          {"fg": s:norm})
call s:h("markdownBold",                {"fg": s:norm  , "gui": "bold"       , "cterm": "bold"  })
call s:h("markdownBoldItalic",          {"fg": s:norm  , "gui": "bold,italic", "cterm": "bold"  })
call s:h("markdownEscape",              {"fg": s:norm})
call s:h("markdownH1",                  {"fg": s:head_a, "gui": "bold,italic", "cterm": "bold"  })
call s:h("markdownH2",                  {"fg": s:head_a, "gui": "bold"       , "cterm": "bold"  })
call s:h("markdownH3",                  {"fg": s:head_a, "gui": "italic"     , "cterm": "italic"})
call s:h("markdownH4",                  {"fg": s:head_a, "gui": "italic"     , "cterm": "italic"})
call s:h("mckarkdownH5",                  {"fg": s:head_a})
call s:h("markdownH6",                  {"fg": s:head_a})
call s:h("markdownHeadingDelimiter",    {"fg": s:norm})
call s:h("markdownHeadingRule",         {"fg": s:norm})
call s:h("markdownId",                  {"fg": s:medium_gray})
call s:h("markdownIdDeclaration",       {"fg": s:norm_subtle})
call s:h("markdownItalic",              {"fg": s:norm  , "gui": "italic"     , "cterm": "italic"})
call s:h("markdownLinkDelimiter",       {"fg": s:medium_gray})
call s:h("markdownLinkText",            {"fg": s:norm})
call s:h("markdownLinkTextDelimiter",   {"fg": s:medium_gray})
call s:h("markdownListMarker",          {"fg": s:norm})
call s:h("markdownOrderedListMarker",   {"fg": s:norm})
call s:h("markdownRule",                {"fg": s:norm})
call s:h("markdownUrl",                 {"fg": s:medium_gray, "gui": "underline", "cterm": "underline"})
call s:h("markdownUrlDelimiter",        {"fg": s:medium_gray})
call s:h("markdownUrlTitle",            {"fg": s:norm})
call s:h("markdownUrlTitleDelimiter",   {"fg": s:medium_gray})
call s:h("markdownCode",                {"fg": s:norm})
call s:h("markdownCodeDelimiter",       {"fg": s:norm})

" plasticboy/vim-markdown
call s:h("mkdBlockQuote",               {"fg": s:norm})
call s:h("mkdDelimiter",                {"fg": s:medium_gray})
call s:h("mkdID",                       {"fg": s:medium_gray})
call s:h("mkdLineContinue",             {"fg": s:norm})
call s:h("mkdLink",                     {"fg": s:norm})
call s:h("mkdLinkDef",                  {"fg": s:medium_gray})
call s:h("mkdListItem",                 {"fg": s:norm})
call s:h("mkdNonListItemBlock",         {"fg": s:norm})  " bug in syntax?
call s:h("mkdRule",                     {"fg": s:norm})
call s:h("mkdUrl",                      {"fg": s:medium_gray, "gui": "underline", "cterm": "underline"})
call s:h("mkdCode",                     {"fg": s:norm})
call s:h("mkdIndentCode",               {"fg": s:norm})

" gabrielelana/vim-markdown
call s:h("markdownBlockquoteDelimiter", {"fg": s:norm})
call s:h("markdownInlineDelimiter",     {"fg": s:norm})
call s:h("markdownItemDelimiter",       {"fg": s:norm})
call s:h("markdownLinkReference",       {"fg": s:medium_gray})
call s:h("markdownLinkText",            {"fg": s:norm})
call s:h("markdownLinkTextContainer",   {"fg": s:medium_gray})
call s:h("markdownLinkUrl",             {"fg": s:medium_gray, "gui": "underline", "cterm": "underline"})
call s:h("markdownLinkUrlContainer",    {"fg": s:medium_gray})
call s:h("markdownFencedCodeBlock",     {"fg": s:norm})
call s:h("markdownInlineCode",          {"fg": s:norm})

" mattly/vim-markdown-enhancements
call s:h("mmdFootnoteDelimiter",        {"fg": s:medium_gray})
call s:h("mmdFootnoteMarker",           {"fg": s:norm})
call s:h("mmdTableAlign",               {"fg": s:norm})
call s:h("mmdTableDelimiter",           {"fg": s:norm})
call s:h("mmdTableHeadDelimiter",       {"fg": s:norm})
call s:h("mmdTableHeader",              {"fg": s:norm})
call s:h("mmdTableCaptionDelimiter",    {"fg": s:norm})
call s:h("mmdTableCaption",             {"fg": s:norm})

" Textile content
" https://github.com/timcharper/textile.vim/blob/master/syntax/textile.vim
"call s:h("txtBold",                {"fg": s:norm  , "gui": "bold"       , "cterm": "bold"  })
"call s:h("txtEmphasis",            {"fg": s:norm  , "gui": "italic"     , "cterm": "italic"})

" XML content
hi! link xmlTag                     htmlTag
hi! link xmlEndTag                  xmlTag
hi! link xmlTagName                 htmlTagName

" Signify
call s:h("SignifySignAdd",{"fg": s:portage})
call s:h("SignifySignDelete",{"fg": s:whiskey})
call s:h("SignifySignChange",{"fg": s:nebula})
call s:h("SignifySignDeleteFirstLine",{"fg": s:whiskey})

" GitGutter
call s:h("GitGutterAdd",{"fg": s:portage, "bg": s:bg_subtle})
call s:h("GitGutterDelete",{"fg": s:whiskey, "bg": s:bg_subtle})
call s:h("GitGutterChange",{"fg": s:nebula, "bg": s:bg_subtle})
call s:h("GitGutterChangeDelete",{"fg": s:whiskey, "bg": s:bg_subtle})


"nvim terminal colors
let g:terminal_color_0 = s:bg_dark.gui
let g:terminal_color_1 = s:whiskey.gui
let g:terminal_color_2 = s:portage.gui
let g:terminal_color_3 = s:nebula.gui
let g:terminal_color_4 = s:japonica.gui
let g:terminal_color_5 = s:rose.gui
let g:terminal_color_6 = s:glacier.gui
let g:terminal_color_7 = s:clouds.gui
let g:terminal_color_8 = s:bg_subtle.gui
let g:terminal_color_9 = s:bourbon.gui
let g:terminal_color_10 = s:moody_blue.gui
let g:terminal_color_11 = s:gum_leaf.gui
let g:terminal_color_12 = s:antique_brass.gui
let g:terminal_color_13 = s:froly.gui
let g:terminal_color_14 = s:danube.gui
let g:terminal_color_15 = s:dark_clouds.gui
