function! myspacevim#before() abort
    let g:mapleader = ','
    nnoremap <leader>s :BLines<cr>
    nnoremap <leader>f :Files<cr>
endfunction

function! myspacevim#after() abort
   " maybe someday ill do a thing here  
endfunction
