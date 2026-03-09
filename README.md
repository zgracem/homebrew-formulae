# homebrew-formulae

Custom Homebrew files for my own use.

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

### `groff-pdfmark`

[`pdfmark`] is a suite of macros designed to facilitate the creation of PDF
files using [`groff`] as the primary typesetting engine, maintained and
distributed separately from `groff` since February 2026.

[`groff`]: https://www.gnu.org/software/groff/
[`pdfmark`]: https://savannah.nongnu.org/projects/groff-pdfmark

```sh
brew install zgracem/formulae/groff-pdfmark
```

### `imagemagick`

ImageMagick with additional features (`libmagic`, `mozjpeg` and `pango`)
included at build time.

```sh
brew install zgracem/formulae/imagemagick
```

## Casks

### `acorn@preview`

Downloads (and livechecks) development builds of [Acorn].

```sh
brew install --cask zgracem/formulae/acorn@preview
```

[Acorn]: https://flyingmeat.com/download/latest

### `lockscreen`

Builds [a simple .app][lock] to quickly lock the screen in macOS.

```sh
brew install --cask zgracem/formulae/lockscreen
```

[lock]: https://github.com/gaomd/lock-screen-app
