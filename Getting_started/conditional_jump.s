.intel_syntax noprefix
.global _start
_start:

mov ebx, [rdi+4]
mov ecx, [rdi+8]
mov edx, [rdi+12]
mov eax, [rdi]

cmp eax, 0x7f454c46
je case1

cmp eax,0x7f454c46
je case2

imul ebx,ecx
imul ebx,edx
jmp done 

case1:
add ebx,ecx
add ebx,edx
jmp done

case2:
sub ebx,ecx
sub ebx,edx
jmp done 

done:
mov eax, ebx

