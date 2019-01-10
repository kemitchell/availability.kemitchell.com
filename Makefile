.PHONY: test spell

test: spell

spell:
	aspell check --dont-backup index.html

