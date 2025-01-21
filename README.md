# homebrew-formulae

Custom Homebrew formulae for my own use.

## Formulae

### `calendar`

An up-to-date version of the BSD [`calendar(1)`][cal] which ships with macOS,
and corresponding [custom data files].

```sh
brew install zgracem/formulae/calendar
brew install zgracem/formulae/zgm-calendar-data
```

[cal]: https://packages.debian.org/stable/calendar
[custom data files]: https://github.com/zgracem/calendar-data

### `imagemagick`

ImageMagick with `mozjpeg` included at build time.

```sh
brew install zgracem/formulae/imagemagick
```

### `unrar`

`unrar` was [removed](https://github.com/Homebrew/homebrew-core/pull/66609) from
Homebrew in December 2020 because it's not open source software.

```sh
brew install zgracem/formulae/unrar
```

## Casks

### `acorn@preview`

Downloads (and livechecks) development builds of [Acorn].

[Acorn]: https://flyingmeat.com/download/latest

### `lockscreen`

Builds [a simple .app][lock] to quickly lock the screen in macOS.

```sh
brew install zgracem/formulae/lockscreen
```

[lock]: https://github.com/gaomd/lock-screen-app
