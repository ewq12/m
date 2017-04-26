;mess marco msg
;mov ah,09h
;lea dx,msg
;int 21h
;endm

.model small

.data
;msg1 10,13,'Array :$'
n1 db 00h
n2 db 00h
arr db 15,?,15 dup('$')

.code
mov ax,@data
mov ds,ax

mov dh,0h
mov ch,05h
lea si,arr
inc si
inc si

l1:call accept
mov al,n1
mov [si],al
inc si
dec ch
jnz l1

mov ch,05h
lea si,arr

inc si
inc si

l2:call summ


mov n1,dh
call disp

mov ah,4ch
int 21h         ;terminate program

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

summ proc near
adc dh,[si]
inc si
dec ch
jnz l2
ret
endp

disp proc near
mov bl,n1
and bl,0F0h
mov cl,04h
ror bl,cl
cmp bl,04h
jc label3
and bl,07h
label3: add bl,30h
mov dl,bl
mov ah,02h
int 21h

mov bl,n1
and bl,0Fh
cmp bl,0Ah
jc label4
and bl,07h
label4: add bl,30h
mov dl,bl
mov bh,02h
int 21h
ret
endp


end


