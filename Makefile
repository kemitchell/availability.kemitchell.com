.PHONY: test spell

test: spell

spell:
	aspell check index.html

