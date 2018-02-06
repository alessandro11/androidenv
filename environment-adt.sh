export _JAVA_AWT_WM_NONREPARENTING=1
export JAVA_HOME=/usr/local/jdk1.8.0_65
export LD_LIBRARY_PATH=$HOME/android/adt/sdk/tools/lib
export ANDROID_EMULATOR_HOME=$HOME/.android
export ANDROID_SDK_ROOT=$HOME/android/adt/sdk

[[ -f /dev/kvm ]] && sudo modprobe kvm-intel
