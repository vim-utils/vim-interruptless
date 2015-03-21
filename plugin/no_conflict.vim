if exists('g:loaded_no_conflict') && g:loaded_no_conflict
  finish
endif
let g:loaded_no_conflict = 1

let s:save_cpo = &cpo
set cpo&vim

function! s:file_changed()
  let v:fcs_choice = 'just do nothing'
  let filename = expand("<afile>")
  " how to detect file created event?
  if v:fcs_reason ==# 'conflict'
    echohl WarningMsg
    echo 'Warning: File "'.filename.'" has changed and the buffer was changed in Vim as well'
    echohl None
  endif
endfunction

au FileChangedShell * call <SID>file_changed()

let &cpo = s:save_cpo
unlet s:save_cpo
