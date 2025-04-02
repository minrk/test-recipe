# Test recipe for streaming output with carriage-returns (CR)

test recipe for https://github.com/prefix-dev/rattler-build/issues/1525

Runs a build script that rewrites lines with CR (`\r`)

rattler-build loses almost all output:

```
pixi run rattler-build
```

conda-build preserves all output, treating CR as LF:

```
pixi run conda-build
```
