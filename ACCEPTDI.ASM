.model small
.data
n1 db 0h
n2 db 0h

.code
mov ax,@data
mov dx,ax

call accept
call disp

mov ah,4ch
int 21h

accept proc near

mov ah,01h
int 21h
cmp al,3Ah
jc label1
sub al,07h
label1: and al,0Fh
mov cl,04h
ror al,cl
mov n1,al

mov ah,01h
int 21h
cmp al,3Ah
jc label2
sub al,07h
label2: and al,0Fh
add al,n1
mov n1,al
ret
endp

disp proc near

mov al,n1
and al,0F0h
mov cl,04h
ror al,cl
cmp al,04h
jc label3
and al,07h
label3: add al,30h
mov dl,al
mov ah,02h
int 21h

mov al,n1
and al,0Fh
cmp al,0Ah
jc label4
and al,07h
label4: add al,30h
mov dl,al
mov ah,02h
int 21h
ret
endp

end
