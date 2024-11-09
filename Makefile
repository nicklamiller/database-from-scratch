.PHONY: install-dev lint pre-commit build test-only test

install-dev:
		cp tools/pre-commit .git/hooks/pre-commit
		chmod +x .git/hooks/pre-commit

lint:
		git-clang-format

pre-commit:
		make lint

build:
		gcc sqlite.c -o a.out

test-only:
		bundle exec rspec -f d

test:
		make build
		make test-only
