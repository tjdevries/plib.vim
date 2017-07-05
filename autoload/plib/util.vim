let s:error_prefix = '[PLIB]: '

function! plib#util#throw_type_error(type_name, value) abort
  throw printf(s:error_prefix . 'Strict Type (%s) not valid for value: %s',
        \ a:type_name,
        \ a:value
        \ )
endfunction

function! plib#util#throw_error(msg) abort
  throw s:error_prefix . a:msg
endfunction
