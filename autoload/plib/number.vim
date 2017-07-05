function! plib#number#_check(number) abort
  let type_match = (type(a:number) == v:t_number)

  if !type_match && plib#opt#get('strict_types')
    call plib#util#throw_type_error('number', a:number)
  endif

  return type_match
endfunction
