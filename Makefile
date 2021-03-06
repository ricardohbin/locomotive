NODE = node
TEST = ./node_modules/.bin/vows
TESTS ?= test/*-test.js test/**/*-test.js test/**/**/*-test.js

test:
	@NODE_ENV=test NODE_PATH=lib $(TEST) $(TEST_FLAGS) $(TESTS)

docs: docs/api.html

docs/api.html: lib/locomotive/*.js
	dox \
		--title Locomotive \
		--desc "Web MVC framework built on Express" \
		$(shell find lib/locomotive/* -type f) > $@

docclean:
	rm -f docs/*.{1,html}

.PHONY: test docs docclean
