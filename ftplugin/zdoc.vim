setlocal softtabstop=2
setlocal tabstop=2
setlocal shiftwidth=2

setlocal foldmethod=expr
setlocal foldexpr=GetZdocFold(v:lnum)

function! GetZdocFold(lnum)
    let l:line = getline(a:lnum)

    " If the line is empty space / line
    if l:line =~? '\v^\s*$'
        let l:next = getline(a:lnum + 1)
        " If the next line is a header, we will set this to to the same header
        " level as the header to allow folding
        if l:next =~? '\v^#'
            let l:len = len(matchstr(l:next, '^#\+'))
            return l:len - 1
        endif

        " If the next line is empty, we will also set it to 0. We only
        " allow 1 empty space between lines. If we have 2 empty spaces, we
        " returns foldlevel of header - 1
        if l:next =~? '\v^\s*$'
            return PreviousHeaderLevel(a:lnum) - 1
        endif

        " if not we will use previous header's
        return PreviousHeaderLevel(a:lnum)
    endif

    if l:line =~? '\v^#'
        let l:len = len(matchstr(l:line, '^#\+'))
        return l:len
    else
        " This bit handles the indentation part
        let l:currentIndent = IndentLevel(a:lnum)
        let l:nextIndent = IndentLevel(a:lnum + 1)
        " There might be a better way to do this instead of taking previous header
        " For example, just using the fold level of the previous line
        if l:nextIndent > l:currentIndent
            return PreviousHeaderLevel(a:lnum) + l:nextIndent
        else
            return PreviousHeaderLevel(a:lnum) + l:currentIndent
        endif
    endif
endfunction

function! PreviousHeaderLevel(lnum)
    let l:previousHeader = PreviousHeader(a:lnum)
    if l:previousHeader == -1
        return 0
    endif
    return len(matchstr(getline(l:previousHeader), '^#\+'))
endfunction

function! IndentLevel(lnum)
    return indent(a:lnum) / &shiftwidth
endfunction

function! PreviousHeader(lnum)
    let l:current = a:lnum - 1
    while current >= 0
        if getline(l:current) =~? '\v^#'
            return l:current
        endif
        let l:current -= 1
    endwhile
    return -1
endfunction

function MyFoldText()
  let line = getline(v:foldstart)
  let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
  return line . " ••••••••••• (" . (v:foldend - v:foldstart) . " lines) "
endfunction
setlocal foldtext=MyFoldText()
nnoremap <silent> zz :setlocal foldmethod=expr<CR>
