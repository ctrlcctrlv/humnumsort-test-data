#!/bin/bash
# Make HTML with `pandoc --highlight-style breezedark -f gfm -t html --self-contained -s README.md -o -`
# (Optionally) `/usr/bin/xidel --input-format=html --output-format=xml --output-node-indent README.html --xquery "$(cat scripts/xidel.xq)" | xmllint --pretty 1 -`
test_file() {
	([ ! -f "$1" ] && unzstd "$1".zst ; time hns < "$1" > /dev/null 2>&1) 2>&1 | sed 's/^/\t\t/'
}
cat << EOF
# Expensive tests for \`hns\` (\`h\`uman \`n\`umeric \`s\`ort)

<!-- Rebuild with README.md.sh -->

&copy;2022–2023 Fredrick R. Brennan and \`hns\` authors. Apache-2 licensed like parent package.

See parent [\`hns\`](https://github.com/ctrlcctrlv/humnumsort) package.

1. \`1000000.txt.zst\`
    = one million numbers.
    * regenerate with \`seq 0 1000000\`
	- \`\`\`bash
	  $( test_file 1000000.txt )
	  \`\`\`
2. \`10000000.txt.zst\`
    = ten million sequential numbers.
    * regenerate with \`seq 0 10000000\`

	- \`\`\`bash
	  $( test_file 10000000.txt )
	  \`\`\`
3. \`0.0.0.0／8.txt.zst\`
    = all IPv4 addresses in Class A network №0
    * regenerate with:
        \`\`\`bash        
$(awk '{printf "        %s\n", $0}' < scripts/0.0.0.0／8.sh)
        \`\`\`

    * <s>warning: on my system it takes about as long to generate as it does to sort!</s>
       as of 0.2.0 this is fixed, MUCH faster! ≈30x!:
        - \`\`\`bash
          $( test_file 0.0.0.0／8.txt )
          \`\`\`
4. \`negatives.txt\`
    = 50,000 pseudo-random numbers
    * regenerate with:
        \`\`\`python
$(awk '{printf "        %s\n", $0}' <  scripts/negatives.py)
        \`\`\`
        - \`\`\`bash
          $( test_file negatives.txt )
          \`\`\`
EOF
