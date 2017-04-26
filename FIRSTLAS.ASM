mess macro msg
mov ah,09h
lea dx,msg
int 21h
endm

.model small
.data
msg1 db 10,13,'Enter the String : $'
msg2 db 10,13,'Last Letter of string : $'
msg3 db 10,13,'First Letter of string : $'

str1 db 10,?,10 dup('$')
str2 db 10,?,10 dup('$')
n5 db 00h

.code
mov ax,@data
mov ds,ax

mess msg1
mov ah,0Ah
lea dx,str1
int 21h

mess msg2
lea si,str1
mov dl,[si+2]
mov ah,02h
int 21h


lea si,str1
inc si
mov cl,[si]

l1:
inc si
dec cl
jnz l1

mess msg3
mov dl,[si]
mov ah,02h
int 21h

mov ah,4ch
int 21h
end 
