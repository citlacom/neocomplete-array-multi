let s:save_cpo = &cpo
set cpo&vim

function! neocomplete#filters#remove_lead_trail_quotes#define() "{{{
  return s:converter
endfunction"}}}

let s:converter = {
      \ 'name' : 'remove_lead_trail_quotes',
      \ 'description' : 'Remove the leading and trailing quotes and suggest as candidates',
      \}

function! s:converter.filter(context) "{{{
  let candidates = []
  let pattern = '^''\|''$'

  for candidate in a:context.candidates
    call add(candidates, candidate)
    let newcandidate = copy(candidate)
    while (newcandidate.word =~ pattern)
      let newcandidate.word = substitute(newcandidate.word, pattern, '', '')
      call add(candidates, newcandidate)
    endwhile
  endfor

  return candidates
endfunction"}}}

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: foldmethod=marker
