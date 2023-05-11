# Expensive tests for `hns` (`h`uman `n`umeric `s`ort)

<!-- Rebuild with README.md.sh -->

&copy;2022–2023 Fredrick R. Brennan and `hns` authors. Apache-2 licensed like parent package.

See parent [`hns`](https://github.com/ctrlcctrlv/humnumsort) package.

1. `1000000.txt.zst`
    = one million numbers.
    * regenerate with `seq 0 1000000`
	- ```bash
	  		
		real	0m0.177s
		user	0m0.083s
		sys	0m0.094s
	  ```
2. `10000000.txt.zst`
    = ten million sequential numbers.
    * regenerate with `seq 0 10000000`

	- ```bash
	  		
		real	0m1.894s
		user	0m0.899s
		sys	0m0.988s
	  ```
3. `0.0.0.0／8.txt.zst`
    = all IPv4 addresses in Class A network №0
    * regenerate with:
        ```bash        
        #!/bin/bash
        SEQ=$(seq 0 255)
        for i in $SEQ; do
            for j in $SEQ; do
                for k in $SEQ; do
                    echo 0.$i.$j.$k
                done
            done
        done
        ```

    * <s>warning: on my system it takes about as long to generate as it does to sort!</s>
       as of 0.2.0 this is fixed, MUCH faster! ≈30x!:
        - ```bash
          		
		real	0m3.211s
		user	0m1.506s
		sys	0m1.696s
          ```
4. `negatives.txt`
    = 50,000 pseudo-random numbers
    * regenerate with:
        ```python
        #!/usr/bin/env python3
        # run as ./negatives.py > negatives.txt
        import random
        import sys
        
        _, OUT = sys.argv
        
        random.seed(a=0)
        
        g = (str(random.randrange(-100000, 100000)) for i in range(50000))
        
        data = "\n".join(g)
        
        print(data)
        ```
        - ```bash
          		
		real	0m0.048s
		user	0m0.041s
		sys	0m0.006s
          ```
