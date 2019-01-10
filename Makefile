TERMS=$(wildcard *.mustache)
COMMONMARK=node_modules/.bin/commonmark
MUSTACHE=node_modules/.bin/mustache

all: $(TERMS:.mustache=.html)

%.md: view.json %.mustache | $(MUSTACHE)
	$(MUSTACHE) $^ > $@

%.html: %.md _before.html _after.html | $(MUSTACHE)
	cat _before.html > $@
	$(COMMONMARK) -t html --smart $< >> $@
	cat _after.html >> $@

$(COMMONMARK) $(MUSTACHE):
	npm install

.PHONY: test spell

test: spell

spell:
	aspell check --dont-backup index.html

