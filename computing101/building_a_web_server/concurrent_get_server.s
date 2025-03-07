.intel_syntax noprefix
.globl _start

.section .text
_start:
    mov rdi, 2
    mov rsi, 1
    mov rdx, 0
    mov rax, 0x29
    syscall

    mov rdi, 3
    lea rsi, [rip+sockaddr]
    mov rdx, 16
    mov rax, 0x31
    syscall

    mov rdi, 3
    mov rsi, 0
    mov rax, 0x32
    syscall

    mov rdi, 3
    mov rsi, 0
    mov rdx, 0
    mov rax, 0x2b
    syscall

    mov rax, 0x39
    syscall

    cmp rax, 0
    je Child_process

Parent_process:
    mov rdi, 4          # Close the accepted connection
    mov rax, 0x03
    syscall

    mov rdi, 3
    mov rsi, 0
    mov rdx, 0
    mov rax, 0x2b
    syscall

Child_process:
    mov rdi, 3          # Close the Socket listener
    mov rax, 0x03
    syscall

    mov rdi, 4
    mov rsi, rsp
    mov rdx, 256
    mov rax, 0x00
    syscall

    mov r10, rsp

Parse_GET:
    mov al, byte ptr [r10]
    cmp al, ' '
    je Done_1
    add r10, 1
    jmp Parse_GET

Done_1:
    add r10, 1
    mov r11, r10

Parse_filename:
    mov al, byte ptr [r11]
    cmp al, ' '
    je Done_2
    add r11, 1
    jmp Parse_filename

Done_2:
    mov byte ptr [r11], 0

    mov rdi, r10
    mov rsi, 0
    mov rdx, 0
    mov rax, 0x02
    syscall

    mov rdi, 3
    mov rsi, rsp
    mov rdx, 256
    mov rax, 0x00
    syscall

    mov r12, rax

    mov rdi, 3
    mov rax, 0x03
    syscall

    mov rdi, 4
    lea rsi, [rip+response]
    mov rdx, 19
    mov rax, 0x01
    syscall

    mov rdi, 4
    mov rsi, rsp
    mov rdx, r12
    mov rax, 0x01
    syscall

    mov rdi, 4
    mov rax, 0x03
    syscall

    mov rdi, 3
    mov rsi, 0
    mov rdx, 0
    mov rax, 0x2b
    syscall

    
    mov rdi, 0
    mov rax, 0x3c    
    syscall

.section .data
sockaddr:
    .2byte 2
    .2byte 0x5000
    .4byte 0
    .8byte 0

response: 
    .string "HTTP/1.0 200 OK\r\n\r\n"
