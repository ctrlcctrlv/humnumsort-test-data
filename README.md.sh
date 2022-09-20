#!/bin/bash
# Make HTML with `pandoc --highlight-style breezedark -f gfm -t html --self-contained -s README.md -o -`
# (Optionally) `/usr/bin/xidel --input-format=html --output-format=xml --output-node-indent README.html --xquery "$(cat scripts/xidel.xq)" | xmllint --pretty 1 -`
cat << EOF
# Expensive tests for \`hns\` (\`h\`uman \`n\`umeric \`s\`ort)

<!-- Rebuild with README.md.sh -->

ⓒ 2022 Fredrick R. Brennan and \`hns\` authors. Apache-2 licensed like parent package.

See parent [\`hns\`](https://github.com/ctrlcctrlv/humnumsort) package.

1. \`1000000.txt.zst\`
    = one million numbers.
    * regenerate with \`seq 0 1000000\`
2. \`10000000.txt.zst\`
    = ten million sequential numbers.
    * regenerate with \`seq 0 10000000\`
3. \`0.0.0.0／8.txt.zst\`
    = all IPv4 addresses in Class A network №0
    * regenerate with:
        \`\`\`bash        
$(awk '{printf "        %s\n", $0}' < scripts/0.0.0.0／8.sh)
        \`\`\`

    * warning: on my system it takes about as long to generate as it does to sort!
        \`\`\`css
        {
            real:    29.471s;
            user:    27.638s;
            sys:     1.832s;
        }
        \`\`\`
4. \`negatives.txt\`
    = 50,000 pseudo-random numbers
    * regenerate with:
        \`\`\`python
$(awk '{printf "        %s\n", $0}' <  scripts/negatives.py)
        \`\`\`
EOF
