README.md:
	./README.md.sh > $@

README.html: README.md
	(pandoc --highlight-style breezedark -f gfm -t html --self-contained -s README.md | \
		/usr/bin/xidel --input-format=html --output-format=html --output-node-indent --xquery "$$(cat scripts/xidel.xq)" | \
		xmllint --html --pretty 1 -) > $@
