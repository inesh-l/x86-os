export PREFIX="$HOME/opt/i686-cross-compiler"
export TARGET=i686-elf
export PATH="$PREFIX/bin:$PATH"

cd $HOME/src
 
mkdir build-binutils
cd build-binutils
../binutils-2.41.90/configure --target=$TARGET --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror
make
make install

cd $HOME/src
 
# The $PREFIX/bin dir _must_ be in the PATH. We did that above.
which -- $TARGET-as || echo $TARGET-as is not in the PATH
 
mkdir build-gcc
cd build-gcc
../gcc-12.2.0/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --enable-languages=c,c++ --without-headers
make all-gcc
make all-target-libgcc
make install-gcc
make install-target-libgcc

