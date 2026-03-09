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

[`groff⁠-⁠pdfmark`][pdf] provides a suite of macro packages designed to
facilitate the creation of PDF files, using [GNU `roff`][groff] as the primary
typesetting engine.

[pdf]: https://savannah.nongnu.org/projects/groff-pdfmark
[groff]: https://www.gnu.org/software/groff/

```sh
brew install groff⁠-⁠pdfmark
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
