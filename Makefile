.PHONY: test

build:
		gcc sqlite.c -o a.out

test:
		make build
		bundle exec rspec -f d
