# libGL error: failed to load driver: swrast OR AVD doesn't load and no error message displayed
# .../Sdk/emulator/lib64/libstdc++
export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1

export LD_LIBRARY_PATH=/opt/android/tools/lib64:/opt/android/tools/lib
export ANDROID_EMULATOR_HOME=/home/m3cool/.android
export ANDROID_SDK_ROOT=/opt/android

[[ -f /dev/kvm ]] && sudo modprobe kvm-intel

return 0
