
vmlinux: 
	mkdir -p build
	make -C buildroot clean
	make -C buildroot defconfig BR2_DEFCONFIG=../configs/buildroot_defconfig
	make -C buildroot
	cp buildroot/output/images/vmlinux build/vmlinux

bbl: vmlinux
	mkdir -p build
	cd build && ../riscv-pk/configure --host=riscv64-unknown-elf --with-payload=vmlinux  
	make -C build
	cp build/bbl bbl

all: bbl

clean:
	rm -rf build bbl