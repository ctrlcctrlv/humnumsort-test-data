#!/usr/bin/env python3
# run as ./negatives.py > negatives.txt
import random
import sys

_, OUT = sys.argv

random.seed(a=0)

g = (str(random.randrange(-100000, 100000)) for i in range(50000))

data = "\n".join(g)

print(data)
