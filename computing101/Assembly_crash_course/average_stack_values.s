.intel_syntax noprefix
.global start
_start:

mov rax, [rsp]
add rax, [rsp + 8]
add rax, [rsp + 16]
add rax, [rsp + 24]
mov rbx, 4
div rbx
push rax
