function! s:Add(...)
  let l:pwd = expand("%:p")
  let l:line = line(".")
  echo system("/root/code/vimscript/add.rb " . a:1 . " " . l:pwd . " " . l:line)
  echo "added " . a:1
endfunction

function! s:List()
  echo system("/root/code/vimscript/list.rb")
endfunction

function! s:ListAll()
  echo system("/root/code/vimscript/listall.rb")
endfunction

function! s:Init()
  echo system("/root/code/vimscript/init.rb")
  echo "initialized database"
endfunction

function! s:Find(...)
  echo a:1 . ":"
  echo system("/root/code/vimscript/find.rb " . a:1)
endfunction

function! s:Delete(...)
  echo system("/root/code/vimscript/delete.rb " . a:1)
endfunction

function! s:Jump(...)
  let l:sp = split(system("/root/code/vimscript/find.rb " . a:1), ":")
  exec "edit " . l:sp[0]
  exec ":" . l:sp[1]
endfunction

function! s:TubJump(...)
  let l:sp = split(system("/root/code/vimscript/find.rb " . a:1), ":")
  exec ":tabnew"
  exec "edit " . l:sp[0]
  exec ":" . l:sp[1]
endfunction

command! L call s:List()
"command! N call s:Next()
command! V call s:ListAll()
command! I call s:Init()
command! -nargs=1 A call s:Add(<f-args>)
command! -nargs=1 J call s:Jump(<f-args>)
command! -nargs=1 T call s:TubJump(<f-args>)
command! -nargs=1 F call s:Find(<f-args>)
command! -nargs=1 D call s:Delete(<f-args>)
