" Copy this to all filetype that need this
syn match ZDatetime "\(Mon\|Tue\|Wed\|Thu\|Fri\|Sat\|Sun\) \(\d\d:\d\d:\d\d\) \d\+ \(Jan\|Feb\|Mar\|Apr\|May\|Jun\|Jul\|Aug\|Sep\|Oct\|Nov\|Dec\) \d\d\d\d"
syn keyword ZStop ISTOPHERE
syn match ZCommentSpecial1 "@fixme" contained
syn match ZCommentSpecial1 "@hack" contained
syn match ZCommentSpecial1 "@todo" contained
syn match ZCommentSpecial1 "@remember" contained
syn match ZCommentSpecial2 "@idea" contained
syn match ZCommentSpecial2 "@future" contained
syn match ZCommentSpecial2 "@thoughts" contained
syn match ZCommentSpecial2 "@balance" contained
syn match ZCommentSpecial2 "@question" contained
syn match ZCommentSpecial2 "@backward" contained
syn match ZCommentSpecial2 "@introduce" contained
syn match ZCommentSpecial2 "@assumption" contained
