mess macro msg
mov ah,09h
lea dx,msg
int 21h
endm

.model small
.data
msg1 db 10,13,'Enter the String :$'
msg2 db 10,13,'Reverse of the String is :$'
msg3 db 10,13,'You Entered :$'
str1 db 10,?,10 dup('$')
str2 db 10,?,10 dup('$')

.code
mov ax,@data
mov ds,ax

mess msg1

lea dx,str1
mov ah,0Ah
int 21h

mess msg3      ;wants to prints input string here
mess str1


lea si,str1
mov al,[si]    ;as first place will be same
lea di,str2
mov [di],al    ; copying first place in it

inc si
inc di
mov al,[si]   ;second place will be also same for both string
mov [di],al   ;copying into second string

mov cl,[di]   ;copying length of string
mov ch,00h   
add si,cx     ;for addition cx will be used                                         

label1:
mov al,[si]
mov [di],al
dec si
inc di
dec cl
jnz label1


mess msg2
mess str2   ;wants to print reverse here.

mov ah,4ch
int 21h
end




