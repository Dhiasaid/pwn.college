#!/usr/bin/env python3

import subprocess
subprocess.run(['touch /tmp/pofgvt'],shell=True)
subprocess.run('/challenge/run',stdout=open('/tmp/pofgvt', 'w'))
