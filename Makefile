test:
	sh ./scripts/run_test.sh

lint:
	luacheck lua/* test/*
	selene --display-style=quiet .

style-lint:
	stylua --check .

.PHONY: test lint style-lint
