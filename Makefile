TERMS=$(wildcard *.mustache)
COMMONMARK=node_modules/.bin/commonmark
MUSTACHE=node_modules/.bin/mustache

all: $(TERMS:.mustache=.html)

%.md: view.json %.mustache | $(MUSTACHE)
	$(MUSTACHE) $^ > $@

%.html: %.md partials/_before.html partials/_after.html | $(MUSTACHE)
	cat partials/_before.html > $@
	$(COMMONMARK) -t html --smart $< >> $@
	cat partials/_after.html >> $@

$(COMMONMARK) $(MUSTACHE):
	npm install

.PHONY: test spell

test: spell

spell:
	aspell check --dont-backup index.html
