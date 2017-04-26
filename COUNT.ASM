mess macro msg
mov ah,09h
lea dx,msg
int 21h
endm

.model small
.data
msg1 db 10,13,'Enter the String : $'
msg2 db 10,13,'Count of a is : $'
str1 db 10,?,10 dup('$')
n2 db 00h

.code
mov ax,@data
mov ds,ax

mov ch,00h

mess msg1
mov ah,0Ah
lea dx,str1
int 21h

lea si,str1
inc si
mov cl,[si]
jmp label2

label1:
inc ch
dec cl
cmp cl,00h
je l1

label2:
inc si
mov al,[si]
cmp al,61h
je label1
dec cl
cmp cl,00h
je l1
jmp label2

l1:
mov n2,ch
mess msg2
call disp

mov ah,4ch
int 21h

disp proc near
mov al,n2
and al,0F0h
mov cl,04h
ror al,cl
cmp al,0Ah
jc down
add al,07h
down: add al,30h
mov dl,al
mov ah,02h
int 21h

mov al,n2
and al,0Fh
cmp al,0Ah
jc down2
add al,07h
down2:add al,30h
mov dl,al
mov ah,02h
int 21h
ret
endp

end




