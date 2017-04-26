mess macro msg
mov ah,09h
lea dx,msg
int 21h
endm
.model small
.data
n1 db 0
n2 dw 0
n3 dw 0
n4 db 0
n9 db 0
n7 db 0
n8 db 0
n10 db 0
n11 db 0
n12 db 0
n13 db 0
n14 db 0
n5 dw 0
n6 dw 0
msg1 db 10,13,'Enter the Numerator $'
msg2 db 10,13,'Enter the Denominator $'
msg3 db 10,13,'The quotient $'
msg4 db 10,13,'The remainder $'
.code
mov ax,@data
mov ds,ax

mess msg1
call accept
mov dh,n1
call accept
mov dl,n1
mov n5,dx

call accept
mov dh,n1
call accept
mov dl,n1
mov n6,dx



mess msg2
call accept
mov bh,n1
call accept
mov bl,n1


mov dx,n5
mov ax,n6

div bx
mov n2,ax
mov n10,al
mov n11,ah



mov n3,dx
mov n12, dh
mov n13, dl
mess msg3

mov ah,n11

mov n1,ah

call disp
mov al,n10
mov n1,al
call disp



mess msg4
mov ch,n12
mov n1,ch

call disp
mov ch,n13
mov n1,ch
call disp
mov ah,4ch
int 21h




accept Proc near
 mov ah,01h
 int 21h
 cmp al,3Ah
 jc down
 sub al,07h
 down:and al,0Fh
 mov cl,04h
 ror al,cl

 mov n1,al
 mov ah,01h
 int 21h
 cmp al,3Ah
 jc down1
 sub al,07h
 down1:and al,0Fh
 add al,n1
 mov n1,al
 ret
 endp

 disp Proc near
 mov dh,n1
 and dh,0F0h
 mov cl,04h
 rol dh,cl
 cmp dh, 0Ah
 jc down3
 add dh,07h
 down3:add dh,30h
 mov dl,dh
 mov ah,02h
 int 21h 

 mov dh,n1
 and dh,0Fh
 cmp dh,0Ah
 jc down4
 add dh, 07h
 down4:add dh,30h
 mov dl,dh
 mov ah,02h
 int 21h
 ret
 endp
 end

