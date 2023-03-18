## Just learn Haskell!

### to configure haskell tools
```shell
ghcup tui
```

### versions
| tool  | version  |   
|-------|----------|
| stack | 2.9.3    |
| HLS   | 1.9.1.0  |
| cabal | 3.10.1.0 |
| GHC   | 9.2.2    |

### to create a project:
```shell
stack new project name --resolver=lts-18.28
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
