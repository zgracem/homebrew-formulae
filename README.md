# homebrew-formulae

Custom Homebrew formulae for my own use.

## Formulae

### `calendar`

An up-to-date version of the BSD [`calendar(1)`][cal] which ships with macOS.

```sh
brew install zgracem/formulae/calendar
```

[cal]: https://packages.debian.org/stable/calendar

### `unrar`

`unrar` was [removed](https://github.com/Homebrew/homebrew-core/pull/66609) from
Homebrew in December 2020 because it's not open source software.

```sh
brew install zgracem/formulae/unrar
```

## Casks

### `lockscreen`

Builds [a simple .app][lock] to quickly lock the screen in macOS.

```sh
brew install zgracem/formulae/lockscreen
```

[lock]: https://github.com/gaomd/lock-screen-app

### `sublime-text3`

`sublime-text` was [updated to version 4][st4] in May 2021, which is a paid
upgrade from version 3. The official `homebrew-cask-versions` tap has a cask for
[`sublime-text2`][st2], but not 3.

```sh
brew install zgracem/formulae/sublime-text3
```

[st2]: https://github.com/Homebrew/homebrew-cask-versions/blob/HEAD/Casks/sublime-text2.rb
[st4]: https://github.com/Homebrew/homebrew-cask/pull/106089
