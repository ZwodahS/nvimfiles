" Additional Syntax
syn match haxeAt "@[^ ]\+" contained

syn match formatterOff "@formatter:off"
syn keyword logger Logger
syn keyword assert Assert
syn match haxeComment "//.*" contains=haxeTODO,@Spell,ZDatetime,formatterOff,ZStop,ZCommentSpecial1,ZCommentSpecial2,ZCommentSpecial3,haxeAt,
syn region haxeComment2 start=+/\*+ end=+\*/+ contains=haxeTODO,@Spell,ZDatetime,MDTitle,MDBullet,MDNumber,ZStop,ZCommentSpecial1,ZCommentSpecial2,ZCommentSpecial3,haxeAt,
syn match MDTitle "\v^\s*#+ .*" contained
syn match MDBullet '\v^\s*\-' contained
syn match MDNumber '\v^\s*\d+\.' contained

hi def link assert ZSpecialRed
hi def link logger ZSpecialGreen
hi def link formatterOff CommentNearInvisible
hi def link haxeParam CommentKeywordBlue

hi def link MDTitle MDTitle
hi def link MDBullet MDBullet
hi def link MDNumber MDNumber

hi MDTitle ctermfg=178 guifg=#d7af00
hi MDBullet ctermfg=10 guifg=#00ff00
hi MDNumber ctermfg=10 guifg=#00ff00
syn region haxeFoldBraces start="{" end="}" transparent fold
hi def link ZCommentSpecial1 xxx
hi xxx ctermfg=238 guifg=#ff0000
