# build kernel image
- linux kernel : https://www.kernel.org/pub/linux/kernel/v6.x/linux-6.12.39.tar.xz
- config: hawks.config
- build command: `make ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- KCFLAGS="-march=rv64ima_zicsr_zifencei -mabi=lp64" -KAFLAGS="-march=rv64ima_zicsr_zifencei -mabi=lp64" -j4`
- copy image(`arch/riscv/boot/Image`) to `platform/hawks/`


# build busybox image

```bash
make ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- CFLAGS="-march=rv64ima -mabi=lp64" macvm_defconfig
make ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- CFLAGS="-march=rv64ima -mabi=lp64" -j4
sudo PATH="/home/ticktech/rv64tools/bin:$PATH" make ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- CFLAGS="-march=rv64ima -mabi=lp64" CONFIG_PREFIX=../root install

# make console dev node
cd ../root
sudo mkdir dev
sudo mknod dev/hvc0 c 229 0
sudo mknod dev/console c 5 1

# build ramdisk: cpio or cpio.gz
sudo find . -print0 | sudo cpio --null -ov --format=newc > ../initramfs.cpio
sudo find . -print0 | sudo cpio --null -ov --format=newc | sudo gzip -9 > ../initramfs.cpio.gz

# list files in cpio
cpio -itv < ../initramfs.cpio
```
