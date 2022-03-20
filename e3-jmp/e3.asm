global _start

section .data

section .text
_start:
    mov ebx, 0x0   ; exit status
    mov eax, 0x01  ; sys_exit
    mov ecx, 0x99  ; set ecx to be 0x99
    cmp ecx, 0x100 ; compare ecx to 0x100
    jl skip        ; jump if ecx is less than 0x100
    ;jmp skip      ; jump to 'skip' label
    ;je, jne, jg, jge, jl, jle
    mov ebx, 0xff  ; exit status becomes 0xff if jump failed

skip:
    int 0x80       ; issue system call
