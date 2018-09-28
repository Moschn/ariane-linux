
buildroot_defconfig = configs/buildroot_defconfig
linux_defconfig = configs/linux_defconfig

vmlinux: $(buildroot_defconfig) $(linux_defconfig)
	mkdir -p build
	make -C buildroot clean
	make -C buildroot defconfig BR2_DEFCONFIG=../configs/buildroot_defconfig
	make -C buildroot
	cp buildroot/output/images/vmlinux build/vmlinux
	cp build/vmlinux vmlinux

bbl: vmlinux
	mkdir -p build
	cd build && ../riscv-pk/configure --host=riscv64-unknown-elf --with-payload=vmlinux  
	make -C build
	cp build/bbl bbl

all: bbl

clean:
	rm -rf build bbl vmlinux