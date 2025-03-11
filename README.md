# Test recipe for relink on mac

test recipe for https://github.com/prefix-dev/rattler-build/pull/1476

packages 3 files

- `libabsolute` with `install_name=$PREFIX/lib/libabsolute.dylib`
- `librelative` with default `install_name=librelative.dylib`
- `test_link` executable, which links both

conda-build rewrites the links for both libabsolute and librelative as `@rpath/libname.dylib`.
rattler-build 0.38 doesn't update either one.
The absolute rpath still works due to install-time rewriting,
but the relative path fails to load.

fails:

```
pixi run rattler-build
```

succeeds:

```
pixi run conda-build
```

https://github.com/prefix-dev/rattler-build/pull/1477 fixes rattler-build for this case.
