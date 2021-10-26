GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean


BASEPATH := $(shell pwd)
BUILDDIR=$(BASEPATH)/dist
APP_NAME = "sample-app"


build_app: clean
	 mkdir -p $(BUILDDIR)  &&  $(GOBUILD) -o $(BUILDDIR)/$(APP_NAME) main.go

clean:
	rm -fr $(BUILDDIR)

docker:
	docker build -t sample-app:latest .