mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm

.model small
.data

msg1 db 10,13,'1. Addition.$'
msg2 db 10,13,'2. Substraction.$'
msg3 db 10,13,'3. Multiplication.$'
msg4 db 10,13,'4. Exit.$'
msg5 db 10,13,'Enter the First : $'
msg6 db 10,13,'Enter the Second : $'
msg7 db 10,13,'Select option : $'
msg8 db 10,13,'Answer : $'

n1 db 00h
n2 db 00h

.code
mov ax,@data
mov ds,ax

mess msg1
mess msg2
mess msg3
mess msg4
mess msg7

mov ah,01h
int 21h

cmp al,31h
je addl
cmp al,32h
je subl
cmp al,33h
je multi
cmp al,34h
jmp ex


addl: call addp
      jmp ex
subl: call subp
      jmp ex

multi: call mulp
       jmp ex


addp proc near
call accept
mov n2,al
call accept
add al,n2
mov n2,al
call disp
ret
endp

subp proc near
call accept
mov n2,al
call accept
sub al,n2
mov n2,al
call disp
ret
endp

mulp proc near
call accept
mov bl,al
call accept
mul bl
mov bx,ax
mov n2,bh
call disp
mov n2,bl
call disp
ret
endp

accept proc near
mess msg5
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
label2: and al,0Fh
add al,n1
ret
endp

disp proc near
mess msg8
mov al,n2
and al,0F0h
mov cl,04h
ror al,cl
cmp al,0Ah
jc label3
add al,07h
label3: add al,30h
mov dl,al
mov ah,02h
int 21h

mov al,n2
and al,0Fh
cmp al,0Ah
jc label4
add al,07h
label4: add al,30h
mov dl,al
mov ah,02h
int 21h
ret
endp

ex:
mov ah,4ch
int 21h
end