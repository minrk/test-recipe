LIBNAME=a
LIB=lib${LIBNAME}${SHLIB_EXT}
$CC $CFLAGS $LDFLAGS -shared ${RECIPE_DIR}/a.c -o $LIB
$CC $CFLAGS $LDFLAGS ${RECIPE_DIR}/b.c -L. -l${LIBNAME} -o b
mkdir -p $PREFIX/bin
mkdir -p $PREFIX/lib

cp -v $LIB $PREFIX/lib/
cp -v b $PREFIX/bin/b

# run test
otool -L $PREFIX/lib/$LIB
otool -L $PREFIX/bin/b
b
