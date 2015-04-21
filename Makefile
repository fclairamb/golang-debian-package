VERSION=1.4.2
ARCH:=$(DEB_HOST_ARCH)

ifeq "$(ARCH)" "i386"
	ARCH=386
endif

FILE=tmp/go-$(VERSION)-$(ARCH).tar.gz
URL=https://storage.googleapis.com/golang/go$(VERSION).linux-$(ARCH).tar.gz
ifeq "$(DESTDIR)" ""
	DESTDIR=target
endif

all:
	@echo make packages to create the packages

clean:
	rm -Rf dist debian/golang

$(FILE):
	mkdir -p tmp
	wget $(URL) -c -O $(FILE).tmp && mv $(FILE).tmp $(FILE)

install: $(FILE)
	mkdir -p $(DESTDIR)/opt $(DESTDIR)/usr/bin $(DESTDIR)/usr/local
	
	# Extracting the go standard binaries
	tar -zxvf $(FILE) -C $(DESTDIR)/opt
	
	# Adding some symbolinc links
	for f in `ls $(DESTDIR)/opt/go/bin/* | xargs -n1 basename` ; do \
	  ln -s /opt/go/bin/$$f $(DESTDIR)/usr/bin/$$f ; \
	done

	# Adding some additional (personal) tools
	cp bin/* $(DESTDIR)/usr/bin

package:
	dpkg-buildpackage -b -us -uc
	mkdir -p dist/package
	mv ../*.deb dist/package/
	rm ../*.changes

packages:
	dpkg-buildpackage -b -us -uc -aamd64
	dpkg-buildpackage -b -us -uc -ai386
	mkdir -p dist/package
	mv ../*.deb dist/package/
	rm ../*.changes

test-package:
	make clean
	make package && sudo dpkg -i dist/package/*
