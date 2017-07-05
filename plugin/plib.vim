
" Error on types by default
call plib#opt#set('strict_types', v:true, v:true)

" Error on remove item, but item not in list
call plib#opt#set('strict_remove', v:false, v:true)

" Error on index item, but item not in list
call plib#opt#set('strict_list_index', v:false, v:true)
