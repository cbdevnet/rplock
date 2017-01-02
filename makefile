PREFIX ?= /usr/local

install:
	install -m 0755 rplock "$(DESTDIR)$(PREFIX)/bin"
