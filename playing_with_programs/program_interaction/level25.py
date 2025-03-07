#!/usr/bin/env python3

from pwn import *

p = process(['/challenge/run'], env={'gsizpd': 'tmkvmfzsik'})
p.interactive()
