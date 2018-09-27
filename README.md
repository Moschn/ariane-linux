# Ariane Linux

Build a linux image that boots on ariane

## Prerquisits

You need to have the riscv-gnu toolchain installed under `$RISCV`. Both variants, newlib and libc, must be available.

If you want only softfloat the toolchain must be compiled with 
```
../configure --prefix=/opt/riscv --with-arch=rv64imac --with-abi=lp64
```

## Howto

```
make all
```
the restulting image should be in `./bbl`