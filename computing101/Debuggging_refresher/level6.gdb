run
b *main+589
c
set $i = 0
while $i < 64
    x/gx $rsp+0x28    
    c
    set $i = $i + 1
end

