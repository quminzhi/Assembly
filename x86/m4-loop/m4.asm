; x86_64 - math

section .data
    str1 db "hello, world?", 10, 0    ; str points to starting address
    str2 db "we need a peaceful world", 10, 0

section .text
    global _start

_start:
    mov rax, str1 ; move base address of str to rax
    call _getLength
    
    mov rax, str2
    call _getLength

    mov rax, 60
    mov rdi, 0
    syscall

; func getLength: 
;     @input rax: the starting address of str
_getLength:
    push rax   ; push base address of str into the stack -> rsp, rax will serve as a sliding pointer
    mov rbx, 0 ; set rbx to 0, which counts the length of str
_loopCount:
    inc rax
    inc rbx
    mov cl, [rax] ; move 1 byte (char) where rax points to cl
    cmp cl, 0     ; check if char is \0
    jne _loopCount
    
    ; print
    mov rax, 1   ; sys_write
    mov rdi, 1   ; stdout
    pop rsi      ; base address of str
    mov rdx, rbx ; counter
    syscall

    ret
    



