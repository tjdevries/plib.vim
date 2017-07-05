let s:list = {
      \ }

function! plib#dict#_get() abort
  return s:dict
endfunction

function! plib#dict#_check(dict) abort
  let type_match = (type(a:dict) == v:t_list)

  if !type_match && plib#opt#get('strict_types')
    call plib#util#throw_type_error('dict', a:dict)
  endif

  return type_match
endfunction

function! plib#dict#in(dict, value) abort
  if !plib#dict#_check(a:dict)
    return v:null
  endif

  return has_key(a:dict, a:value)
endif

function! plib#dict#keys(dict) abort
  if !plib#dict#_check(a:dict)
    return v:null
  endif

  return keys(a:dict)
endfunction

function! plib#dict#len(dict) abort
  if !plib#dict#_check(a:dict)
    return v:null
  endif

  return len(a:dict)
endfunction

function! plib#dict#clear(dict) abort
  if !plib#dict#_check(a:dict)
    return v:null
  endif

  while keys(a:dict)
endfunction

function! plib#dict#copy(dict) abort
  if !plib#dict#_check(a:dict)
    return v:null
  endif

  return copy(a:dict)
endfunction
