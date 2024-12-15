.PHONY: install-dev lint pre-commit build test-only test

install-dev:
		cp tools/pre-commit .git/hooks/pre-commit
		chmod +x .git/hooks/pre-commit

lint:
		git-clang-format

build:
		cmake -S . -B build
		cmake --build build

pre-commit:
		make lint
		make build

test-only:
		bundle exec rspec -f d

test:
		make build
		make test-only
