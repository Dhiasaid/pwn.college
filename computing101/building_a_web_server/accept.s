.intel_syntax noprefix 
.global _start 
.section .text 
_start: 
mov rdi, 2 
mov rsi, 1 
mov rdx, 0 
mov rax, 41 
syscall 
push rax
sub rsp, 16 
mov word ptr [rsp], 2 
mov word ptr [rsp+2], 0x5000 
mov dword ptr [rsp+4], 0 
mov qword ptr [rsp+8], 8 
mov rsi, rsp 
mov rdx, 16 
mov rdi, rax 
mov rax, 49 
syscall 
add rsp, 16 
mov rax, 0x32 
mov rdi, 3 
mov rsi, 0 
syscall 
mov rax, 0x2B 
mov rdi, 3 
mov rsi, 0 
mov rdx, 0 
syscall 
mov rdi, 0 
mov rax,60
syscall

