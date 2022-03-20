; x86_64 - math

section .data
    digit db 0, 10   ; assign 2 bytes to digit, 0 and \n

section .text
    global _start

_start:
    mov rax, 6
    mov rbx, 2
    div rbx          ; rax: 6 / 2 = 3
    call _printDigit

    push 1
    push 2
    push 3
    pop rax
    call _printDigit
    pop rax
    call _printDigit
    pop rax
    call _printDigit

    mov rax, 0x3C
    mov rdi, 0
    syscall

_printDigit:
    add rax, 48      ; ascii 0: 48
    mov [digit], al  ; add 0 to the lower byte of db, al is only 1 byte
    mov rax, 1       ; sys_write
    mov rdi, 1       ; fd for stdout
    mov rsi, digit
    mov rdx, 2
    syscall
    ret
