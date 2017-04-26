
.model small

.data
n1 db 00h
n2 db 00h
n3 dw 0000h
n4 dw 0000h
n5 dw 0000h
n6 dw 0000h


.code
mov ax,@data
mov ds,ax


call accept
mov bh,n1
call accept
mov bl,n1
mov n3,bx
call accept
mov bh,n1
call accept
mov bl,n1
mov n4,bx


call accept
mov bh,n1
call accept
mov bl,n1
mov n5,bx
call accept
mov bh,n1
call accept
mov bl,n1
mov n6,bx

mov ax,n3
mov bx,n4
mov cx,n6
add bx,cx
mov n6,bx

jnc nocarry
add ax,0001h
nocarry:
add ax,n5
mov n3,ax

mov bx,n3
mov n2,bh
call disp
mov n2,bl
call disp
mov bx,n6
mov n2,bh
call disp
mov n2,bl
call disp

mov ah,4ch
int 21h

accept proc near
mov ah,01h
int 21h
cmp al,3Ah
jc down
sub al,07h
down:
and al,0Fh
ror al,04h
mov n1,al
mov ah,01h
int 21h
cmp al,3Ah
jc down1
sub al,07h
down1:                                                                                                                                                                                                                                                                                                                                                                                  
and al,0Fh
add al,n1
mov n1,al
ret
endp

disp proc near
mov al,n2                                                                                                                                                                                                                                                                                        
and al,0F0h
ror al,04h
cmp al,0Ah
jc d1
add al,07h
d1:
add al,30h
mov dl,al
mov ah,02h
int 21h
mov al,n2
mov al,0Fh
cmp al,0Ah
jc d2
add al,07h
d2:
add al,30h
mov dl,al
mov ah,02h
int 21h
ret
endp

end