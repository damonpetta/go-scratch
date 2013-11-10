#!/usr/bin/make

PACKAGE := .

.PHONY: default all vet test deps

default: all vet

all: deps
	./go build $(PACKAGE)
vet:
	./go vet $(PACKAGE)
fmt:
	./go fmt $(PACKAGE)
test: all
	./go test $(PACKAGE)
clean:
	./go clean $(PACKAGE)

# read in a list of dependencies
deps:
	./go get $(shell cat deps.list)
