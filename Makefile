.PHONY: test

install-dev:
		cp tools/pre-commit .git/hooks/pre-commit
		chmod +x .git/hooks/pre-commit

pre-commit:
		git-clang-format

build:
		gcc sqlite.c -o a.out

test-only:
		bundle exec rspec -f d

test:
		make build
		make test-only
