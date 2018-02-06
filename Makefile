SOURCE_PREFIX = /opt/android
PREFIX = /usr/local/bin

USERID = $(shell id -u)

install: isroot
	ln -s $(SOURCE_PREFIX)/platform-tools/adb $(PREFIX)
	ln -s $(SOURCE_PREFIX)/platform-tools/fastboot $(PREFIX)
	ln -s $(SOURCE_PREFIX)/platform-tools/dmtracedump $(PREFIX)
	ln -s $(SOURCE_PREFIX)/tools/android $(PREFIX)
	ln -s $(SOURCE_PREFIX)/tools/emulator64-x86 $(PREFIX)
	ln -s $(SOURCE_PREFIX)/tools/bin/sdkmanager $(PREFIX)

isroot:
	@if [ $(USERID) -ne 0 ]; then\
		echo "Must be root!";\
		exit 1;\
	fi

uninstall: isroot
	unlink $(PREFIX)/adb
	unlink $(PREFIX)/android
	unlink $(PREFIX)/emulator64-x86
	unlink $(PREFIX)/sdkmanager
	unlink $(PREFIX)/fastboot
	unlink $(PREFIX)/dmtracedump
