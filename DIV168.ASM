mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm

.model small

.data
msg1 db 10,13,'Enter the Numerator : $'
msg2 db 10,13,'Enter the Denominator :$'
msg3 db 10,13,'Quotient : $'
msg4 db 10,13,'Remainder :$'

n1 db 00h
n2 db 00h
n3 db 00h
n4 db 00h
n5 dw 0h

.code
mov ax,@data
mov ds,ax

mess msg1
call accept
mov dh,n1
call accept
mov dl,n1
mov n5,dx
mess msg2
call accept
mov cl,n1

mov ax,n5
div cl

mov n3,al
mov n4,ah
mov cl,n3
mov n2,cl
mess msg3
call disp
mov ch,n4
mov n2,ch
mess msg4
call disp

mov ah,4ch
int 21h


accept proc near
mov ah,01h
int 21h
cmp al,3Ah
jc label1

sub al,07h
label1:and al,0Fh
mov cl,04h
ror al,cl
mov n1,al

mov ah,01h
int 21h
cmp al,3Ah
jc label2
sub al,07h
label2:and al,0Fh
add al,n1
mov n1,al
ret
endp

disp proc near

mov al,n2
and al,0F0h
mov cl,04h
ror al,cl
cmp al,0Ah
jc label3
add al,07h
label3:add al,30h
mov dl,al
mov ah,02h
int 21h

mov al,n2
and al,0Fh
cmp al,0Ah
jc label4
add al,07h
label4:add al,30h
mov dl,al
mov ah,02h
int 21h
ret
endp

end
