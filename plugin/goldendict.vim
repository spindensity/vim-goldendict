" ============================================================================
" File:        goldendict.vim
" Description: A vim/neovim interface of GoldenDict.
" Author:      Jinsong Zhang <spindensity@gmail.com>
" Licence:     MIT
" Website:     https://github.com/spindensity/vim-goldendict/
" ============================================================================

scriptencoding utf-8

if &compatible && exists('g:loaded_goldendict')
    finish
endif
let g:loaded_goldendict = 1

if !exists('g:goldendict_path')
    let g:goldendict_path = 'goldendict'
endif

if has('nvim')
    let s:uni_job_start = function('jobstart')
else
    if has('job')
        let s:uni_job_start = function('job_start')
    else
        let s:uni_job_start = function('system')
    endif
endif

function! s:get_visual_selection() abort
    let text = ''

    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)

    if len(lines) > 0
        let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
        let lines[0] = lines[0][column_start - 1:]
        let text = join(lines, " ")
    endif

    let text = substitute(text, "[ ]*-[ ]*", "-", "g")
    let text = trim(substitute(text, "[\"]*", "", "g"))

    return text
endfunction

function! s:get_current_phrase(phrase, vs_mode_p) abort
    let phrase = a:phrase

    if phrase == ''
        if a:vs_mode_p
            let phrase = s:get_visual_selection()
        else
            let iskeyword_saved = &l:iskeyword
            let &l:iskeyword = "a-z,A-Z,48-57,-,'"
            let phrase = expand("<cword>")
            let &l:iskeyword = iskeyword_saved
        endif
    endif

    return phrase
endfunction

function! goldendict#lookup(phrase, vs_mode_p) abort
    let phrase = s:get_current_phrase(a:phrase, a:vs_mode_p)
    if phrase != ''
        call s:uni_job_start(shellescape(g:goldendict_path) . ' ' . shellescape(phrase))
    else
        echohl WarningMsg
        echo "Empty phrase!"
        echohl None
    endif
endfunction

nnoremap <Plug>(goldendict-lookup-cursor) :<C-U>call goldendict#lookup('', v:false)<CR>
vnoremap <Plug>(goldendict-lookup-visual) :<C-U>call goldendict#lookup('', v:true)<CR>
