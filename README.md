## Just learn Haskell!

### to create a project:
```shell
stack new project name --resolver=lts-20.11
```

### prior to import in idea
```shell
stack build --test --haddock --no-haddock-hyperlink-source
```

### to run one:
```shell
stack run --silent
```