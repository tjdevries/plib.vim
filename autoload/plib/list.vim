let s:list  = {
      \ 'append': function('plib#list#append'),
      \ 'extend': function('plib#list#extend'),
      \ 'insert': function('plib#list#insert'),
      \ 'remove': function('plib#list#remove'),
      \ 'pop' : function('plib#list#pop'),
      \ 'clear' : function('plib#list#clear'),
      \ 'index' : function('plib#list#index'),
      \ 'count' : function('plib#list#count'),
      \ 'sort' : function('plib#list#sort'),
      \ 'reverse' : function('plib#list#reverse'),
      \ 'copy' : function('plib#list#copy'),
      \ }

function! plib#list#_get() abort
  return s:list
endfunction

function! plib#list#_check(list) abort
  let type_match = (type(a:list) == v:t_list)

  if !type_match && plib#opt#get('strict_types')
    call plib#util#throw_type_error('list', a:list)
  endif

  return type_match
endfunction

function! plib#list#append(list, val) abort
  if !plib#list#_check(a:list)
    return v:null
  endif

  return add(a:list, a:val)
endfunction

function! plib#list#extend(list, val) abort
  if !plib#list#_check(a:list)
    return v:null
  endif

  if !plib#list#_check(a:val)
    return v:null
  endif

  return extend(a:list, a:val)
endfunction

function! plib#list#insert(list, index, val) abort
  if !plib#list#_check(a:list)
    return v:null
  endif

  if !plib#number#_check(a:index)
    return v:null
  endif

  return insert(a:list, a:val, a:index)
endfunction

function! plib#list#remove(list, val) abort
  if !plib#list#_check(a:list)
    return v:null
  endif

  let val_index = index(a:list, a:val)

  if val_index < 0
    if plib#opt#get('strict_remove')
      call plib#util#throw_error(printf('Value: %s was not found in list: %s',
            \ a:val,
            \ a:list
            \ ))
    else
      return a:list
    endif
  endif

  " Remove the item, but we discard the value
  call remove(a:list, val_index)

  " Return the modified list
  return a:list
endfunction

function! plib#list#pop(list, ...) abort
  if !plib#list#_check(a:list)
    return v:null
  endif

  if a:0 > 0
    let val = a:1
  else
    let val = len(a:list) - 1
  endif

  if !plib#number#_check(val)
    return v:null
  endif

  " Return the removed item
  return remove(a:list, val)
endfunction

function! plib#list#clear(list) abort
  if !plib#list#_check(a:list)
    return v:null
  endif

  while len(a:list)
    call plib#list#pop(a:list)
  endwhile

  return a:list
endfunction

function! plib#list#index(list, val, ...) abort
  if !plib#list#_check(a:list)
    return v:null
  endif

  if a:0 > 0
    let start = a:1
  else
    let start = 0
  endif

  if a:0 > 1
    let finish = a:2
  else
    let finish = len(a:list) - 1
  endif

  if !plib#number#_check(start)
    return v:null
  endif

  if !plib#number#_check(finish)
    return v:null
  endif

  let val_index = index(a:list, a:val, start)

  if val_index > finish || val_index < 0
    if plib#opt#get('strict_list_index')
      call plib#util#throw_error('Strict list index. No val found: ' . string(a:val) . ' not in ' . string(a:list))
    else
      return v:null
    endif
  endif

  return val_index
endfunction

function! plib#list#count(list, val) abort
  if !plib#list#_check(a:list)
    return v:null
  endif

  return count(a:list, a:val)
endfunction

" TODO: This one is harder
function! plib#list#sort(list, ...) abort
  if !plib#list#_check(a:list)
    return v:null
  endif

  return sort(a:list)
endfunction

function! plib#list#reverse(list) abort
  if !plib#list#_check(a:list)
    return v:null
  endif

  return reverse(a:list)
endfunction

function! plib#list#copy(list) abort
  if !plib#list#_check(a:list)
    return v:null
  endif

  return copy(a:list)
endfunction
