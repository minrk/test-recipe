$CC $CFLAGS $LDFLAGS -shared -Wl,-install_name,$PREFIX/lib/libabsolute.dylib ${RECIPE_DIR}/absolute.c -o libabsolute.dylib
$CC $CFLAGS $LDFLAGS -shared ${RECIPE_DIR}/relative.c -o librelative.dylib

$CC $CFLAGS $LDFLAGS ${RECIPE_DIR}/test_link.c -L. -labsolute -lrelative -o test_link
mkdir -p $PREFIX/bin
mkdir -p $PREFIX/lib

cp -v *${SHLIB_EXT} $PREFIX/lib/
cp -v test_link $PREFIX/bin/test_link

# run test
otool -L *${SHLIB_EXT} $PREFIX/bin/test_link
test_link
