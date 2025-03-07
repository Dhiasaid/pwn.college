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
    mov rdi, 4        
    mov rax, 0x03
    syscall

    
    mov rdi, 3
    mov rsi, 0
    mov rdx, 0
    mov rax, 0x2b
    syscall

Child_process:
    mov rdi, 3         
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
hacker@building-a-web-server~web-server:~$ cat concurrent_post_server.s
.intel_syntax noprefix
.global _start

.section .text

_start:
        mov rdi, 2 
        mov rsi, 1
        mov rdx, 0
        mov rax, 0x29
        syscall

        mov rdi, 3 
        lea rsi, [rip + sockaddr]  
        mov rdx, 16
        mov rax, 0x31
        syscall

        mov rdi, 3 
        mov rsi, 0 
        mov rax, 0x32
        syscall

        mov rdi, 3 
        mov rsi, 0x0
        mov rdx, 0x0
        mov rax, 0x2B
        syscall

        mov r11, rax
        push r11

        mov rax, 0x39 
        syscall

        cmp rax, 0
        je child

parent:
        mov rdi, [rsp]
        mov rax, 0x3
        syscall

        mov rdi, 3 
        mov rsi, 0x0
        mov rdx, 0x0
        mov rax, 0x2B
        syscall

        mov rax, 0x60
        syscall
child:
        mov rdi, 0x3
        mov rax, 0x3
        syscall

        mov rdi, [rsp] 
        lea rsi, file_read
        mov rdx, 1024
        mov rax, 0
        syscall

        mov r12, rax
        push r12 

        mov r8, rsi 
first_e:
        mov al, [r8]
        cmp al, ' '
        je continue
        add r8, 1
        jmp first_e

continue:
        add r8, 1
        mov r10, r8
        mov r9, 0
second_e:
        mov al, [r10]
        cmp al, ' '
        je finish
        add r10, 1
        add r9, 1
        jmp second_e

finish:
        mov BYTE PTR [r10], 0 
        test rax, rax
        js error
        mov rdi, r8 
        mov rsi, 0x41 
        mov rdx, 0x38+0x1c0+0x7 
        mov rax, 2 
        syscall

        pop rdx 
        #mov rcx, rax
        push rax

compare_still:
        #mov eax, [r10]
        cmp DWORD PTR [r10], 0x0a0d0a0d 
        je got_content
        add r10, 1
        add r9, 1
        jmp compare_still

got_content:
        add r10, 4
        add r9, 9
        pop rdi
        mov rsi, r10
        mov rbx, rdx 
        sub rbx, r9
        mov rdx, rbx
        mov rax, 1 
        syscall

        #mov rdi, rcx
        mov rax, 0x3 
        syscall


        pop rdi  
        lea rsi, http_resp
        mov rdx, 19
        mov rax, 1
        syscall

        mov rdi, 0
        mov rax, 60
        syscall

error:
        mov rdi, 4  
        lea rsi, error_code
        mov rdx, 19
        mov rax, 1
        syscall

.section .data
http_resp: .ascii "HTTP/1.0 200 OK\r\n\r\n"
random_text: .ascii "hello"
error_code: .ascii "Error during the transmit"
file_read: .ascii "GET /tmp/tmpzvxse8y0 HTTP/1.1\r\n\r\n"
sockaddr:
        .2byte 2
        .2byte 0x5000 
        .4byte 0
        .8byte 0
addrlen:
        .quad 16
