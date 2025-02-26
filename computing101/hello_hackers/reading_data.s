mov rdi, 0
mov rsi, 1337000
mov rdx, 8
mov rax, 0
syscall
mov rdi,1
mov rsi, 1337000
mov rdx, rdx
mov rax, 1
syscall
mov rdi, 42
mov rax, 60
syscall

