#!/bin/bash

# export CROSS_COMPILE=$(pwd)/toolchain/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-androidkernel-
export CROSS_COMPILE=$(pwd)/toolchain/toolchains-gcc-10.3.0/bin/aarch64-buildroot-linux-gnu-
export CC=$(pwd)/toolchain/clang/host/linux-x86/clang-r383902/bin/clang
export CLANG_TRIPLE=aarch64-linux-gnu-
export ARCH=arm64
#export ANDROID_MAJOR_VERSION=r

export KCFLAGS=-w
export CONFIG_SECTION_MISMATCH_WARN_ONLY=y

make clean
make mrproper

make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y sudo_defconfig
make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y -j32

cp out/arch/arm64/boot/Image $(pwd)/arch/arm64/boot/Image

cp out/arch/arm64/boot/Image.gz $(pwd)/arch/arm64/boot/Image.gz

# make anykernel zip
# cp $(pwd)/arch/arm64/boot/Image $(pwd)/anykernel/
# zip -0 $(pwd)/output/anykernel.zip $(pwd)/anykernel/*
