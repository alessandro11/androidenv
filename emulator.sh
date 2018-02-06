#!/bin/bash

perror() {
	echo $@ 1>&2
}

[ -z "$ANDROID_SDK_ROOT" ] && source $HOME/android/environment.sh
if [ -z "$ANDROID_SDK_ROOT" ]; then
	perror "Environment variable not set ANDROID_SDK_ROOT."
	exit 1
fi

EMULATOR=$(which emulator)
AVD_NAME="$1"
AVD_NAME=${AVD_NAME:-galaxy-api16}

# There is a bug in paaudio.c module, which cause infinite loop in qemu
exec $EMULATOR @${AVD_NAME}\
	 -engine classic -use-system-libs -no-boot-anim -gpu host -accel on -show-kernel -verbose\
	 -qemu -enable-kvm -cpu qemu64 -smp 4 -localtime -vga cirrus -monitor stdio &> /tmp/emulator-android.log & disown

#
# How to run manually.
#
#emulator64-x86 \
#    -gpu on \
#    -sysdir $ANDROID_TARGET \
#    -kernel $ANDROID_TARGET/kernel-qemu \
#    -datadir $ANDROID_AVD \
#    -ramdisk $ANDROID_TARGET/ramdisk.img \
#    -system $ANDROID_TARGET/system.img \
#    -data $ANDROID_AVD/userdata-qemu.img \
#    -sdcard $ANDROID_AVD/sdcard.img \
#    -snapstorage $ANDROID_AVD/snapshots.img \
#    -no-snapshot-load \
#    -show-kernel \
#    -verbose \
#    -qemu -m 1014 -smp 1 -localtime -vga cirrus -enable-kvm -monitor stdio -daemonize -android-hw $ANDROID_AVD/hardware-qemu.ini 
