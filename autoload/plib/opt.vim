let s:plib_options = get(s:, 'plib_options', {})

function! plib#opt#set(option, value, ...)
  if a:0 > 0
    let default = a:1
  else
    let default = v:false
  endif

  " If we're setting a default, and we find the option already set
  " Don't do anything
  if default && has_key(s:plib_options, a:option)
    return
  endif

  let s:plib_options[a:option] = a:value
endfunction

function! plib#opt#get(option)
  if has_key(s:plib_options, a:option)
    return s:plib_options[a:option]
  else
    return v:false
  endif
endfunction
