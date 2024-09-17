" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    norminette.vim                                     :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: jeportie <jeportie@student.42.fr>          +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2024/06/02 16:40:06 by jeportie          #+#    #+#              "
"    Updated: 2024/06/02 16:40:43 by jeportie         ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

" ~/.vim/plugin/norminette.vim

" Dictionary to store Norminette error messages
let s:norminette_errors = {}

" Function to run Norminette on the current file
function! NorminetteRun()
    " Ensure the syntax file is loaded
    silent! syntax enable
    runtime! syntax/norminette.vim

    let l:filename = expand('%:p')
    let l:output = system('norminette ' . l:filename)
    " Clear previous error messages
    let s:norminette_errors = {}
    " Clear existing signs
    execute 'sign unplace * group=norminette'
    call s:HighlightIssues(l:output)
endfunction
" Function to highlight issues reported by Norminette
function! s:HighlightIssues(output)
    call clearmatches()
    for l:line in split(a:output, '\n')
        if l:line =~ 'Error:'
            let l:match = matchlist(l:line, 'Error: \(\w\+\)\s*(line:\s*\(\d\+\),\s*col:\s*\(\d\+\))')
            if !empty(l:match)
                let l:error_type = l:match[1]
                let l:lnum = str2nr(l:match[2])
                let l:col = str2nr(l:match[3])
                " Store the error message in the dictionary
                let s:norminette_errors[l:lnum] = l:line
                " Highlight the issue in the buffer using matchaddpos
                call matchaddpos('NorminetteError', [[l:lnum, l:col]])
                " Place a sign in the gutter
                execute 'sign place ' . l:lnum . ' line=' . l:lnum . ' name=norminetteErrorSign group=norminette'
            endif
        endif
    endfor
endfunction

" Function to show Norminette error message in the command line
function! s:ShowNorminetteError()
    let l:lnum = line('.')
    if has_key(s:norminette_errors, l:lnum)
        echo s:norminette_errors[l:lnum]
    else
        echo ''
    endif
endfunction

" Function to clear errors from the dictionary if fixed
function! s:ClearFixedErrors()
    for l:lnum in keys(s:norminette_errors)
        " If the line no longer contains the error, remove it from the dictionary and clear the sign
        if getline(l:lnum) !~ 'Error'
            unlet s:norminette_errors[l:lnum]
            execute 'sign unplace ' . l:lnum . ' group=norminette'
        endif
    endfor
endfunction

" Define a sign with a red dot
execute 'sign define norminetteErrorSign text=● texthl=Error'

" Create a command to run the Norminette function
command! NorminetteRun call NorminetteRun()

" Map <leader>n to run Norminette manually
nnoremap <leader>n :NorminetteRun<CR>

" Autocmd to show error message when the cursor moves
autocmd CursorMoved * call s:ShowNorminetteError()

" Run Norminette on file save, but don't auto-save on text change
autocmd BufWritePost * call NorminetteRun()
