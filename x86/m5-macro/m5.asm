; x86_64 - math

%include "ext.asm"

; set constant
SYS_READ equ 0x0
SYS_WRITE equ 0x1
SYS_EXIT equ 0x3C
STDIN equ 0x0
STDOUT equ 0x1

%macro printDigitSum 2  ;  1 arg is required
%%loop:                 ; %%<label> makes the label unique, like #ifndef in C
    mov rax, %1      ; mov the first arg to rax
    add rax, %2
    call _printDigit
%endmacro

section .data
    digit db 0, 10   ; assign 2 bytes to digit, 0 and \n

section .text
    global _start

_start:
    printDigitSum 2, 3
    
    mov rax, SYS_EXIT
    mov rdi, 0
    syscall

_printDigit:
    add rax, 48        ; ascii 0: 48
    mov [digit], al    ; add 0 to the lower byte of db, al is only 1 byte
    mov rax, SYS_WRITE ; sys_write
    mov rdi, STDOUT    ; fd for stdout
    mov rsi, digit
    mov rdx, 2
    syscall
    ret
