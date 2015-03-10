
CXX=g++
CPPFLAGS+= -Wall -Wextra -pedantic

all: clean ios-deploy

ios-deploy: clean ios-deploy.cpp
	$(CXX) $(CPPFLAGS) -g -o ios-deploy ios-deploy.cpp -limobiledevice -l:libplist.so.3

install: symlink ios-deploy
	mkdir -p $(prefix)/bin
	cp ios-deploy $(prefix)/bin

uninstall:
	rm $(prefix)/bin/ios-deploy

clean:
	rm -rf demo ios-deploy
