.PHONY: default clean build run lib package-linux package-windows package-osx package

foreplay_dir = "./foreplay"

default: build run

buildclean:
	rm -f $(foreplay_dir)/pkg/*.love

clean:
	rm -f $(foreplay_dir)/pkg/*.love
	rm -rf $(foreplay_dir)/pkg
	rm -rf $(foreplay_dir)/lib

build: buildclean
	@$(foreplay_dir)/build.sh

run:
	@love $(foreplay_dir)/pkg/*.love

setup:
	git submodule update --init --recursive

package-linux: build
	@$(foreplay_dir)/package.sh linux

package-windows: build
	@$(foreplay_dir)/package.sh windows

package-osx: build
	@$(foreplay_dir)/package.sh osx

subupdate:
	git submodule foreach git pull origin master

package: build package-linux package-windows package-osx
