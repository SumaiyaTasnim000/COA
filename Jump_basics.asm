;Unconditional Jump
Abc:mov dx,5678h    ;line being at 1st will create an infinite loop
mov ax,1234h;
mov bx,3456h;
jmp abc
mov cx,3456h
;jump label here will cause the proper jump to occur (here Abc:)





