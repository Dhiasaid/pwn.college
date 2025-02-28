.intel_syntax noprefix
.global _start
_start

mov rdx,0xdeadbeef00001337
mov [rdi],rdx
mov rcx,0xc0ffee0000
mov [rsi],rcx

