https://www.haskell.org/ghcup/#

curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

* ghcup - The Haskell toolchain installer
* ghc   - The Glasgow Haskell Compiler
* cabal - The Cabal build tool for managing Haskell software
* stack - A cross-platform program for developing Haskell projects (similar to cabal)
* hls   - (optional) A language server for developers to integrate with their editor/IDE
  /Users/alexr/.ghcup
  cabal init --interactive
  cabal build
  cabal run

ghcup tui
https://www.haskell.org/ghcup/steps/
hindent
hlint
ormolu/stylish-Haskell

stack upgrade
stack init
stack build --test --haddock --no-haddock-hyperlink-source;
