mess macro msg
mov ah,09h
lea dx,msg
int 21h
endm

.model small
.data
msg1 db 10,13,'Enter the string 1 : $'
msg2 db 10,13,'Enter the string 2 : $'
msg3 db 10,13,'Concate String : $'
str1 db 10,?,10 dup('$')
str2 db 10,?,10 dup('$')
str3 db 20,?,20 dup('$')

.code
mov ax,@data
mov ds,ax

mess msg1
mov ah,0Ah
lea dx,str1
int 21h

lea si,str1
inc si
mov cl,[si]

mess msg2
mov ah,0Ah
lea dx,str2
int 21h

lea di,str3
inc di

label1:
inc si
inc di
mov bl,[si]
mov [di],bl
dec cl
jnz label1

lea si,str2
inc si
mov cl,[si]

label2:
inc si
inc di
mov bl,[si]
mov [di],bl
dec cl
jnz label2

mess msg3
mess str3+2



mov ah,4ch
int 21h
end
