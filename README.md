# Test recipe for source.files

test recipe for https://github.com/prefix-dev/rattler-build/issues/1167

- .gitignore excludes `**/ignored`
- rattler-build inappropriately applies this .gitignore when considering `files.source`
- when the default `output-dir` is in the directory containing `.gitignore`, the `ignored` file is improperly excluded
- placing `output-dir` outside the current directory results in correct files being included

fails:

```
rattler-build build -r recipe
```

succeeds:

```
rattler-build build --output-dir=/tmp/output -r recipe
```

The right fix is probably to ignore `.gitignore` altogether. It doesn't ever seem right to use it.
