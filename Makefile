
.DEFAULT_TARGET: help

.PHONY: clean
clean:
	rm -rf notes/.jekyll-cache
	rm -rf _site


.PHONY: build
build:
	cd notes && bundle install && bundle exec jekyll build --destination=../_site


.PHONY: serve
serve:
	cd notes && bundle exec jekyll serve --destination=../_site


.PHONY: help
help:
	@grep -E \
		'^.PHONY: .*?## .*$$' $(MAKEFILE_LIST) | \
		sort | \
		awk 'BEGIN {FS = ".PHONY: |## "}; {printf "\033[36m%-19s\033[0m %s\n", $$2, $$3}'
