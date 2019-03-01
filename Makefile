proj_dir := $(shell dirname $(abspath $(lastword $(MAKEFILE_LIST))))

VERSION := 1

.DEFAULT_GOAL := run

build:
	docker build -t nifskope:$(VERSION) $(proj_dir)

run: build
	OUTDIR=$(proj_dir)/out VERSION=$(VERSION) $(proj_dir)/docker-run
