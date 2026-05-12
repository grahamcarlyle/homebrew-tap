# homebrew-tap

Personal Homebrew tap.

## Griddle

[Griddle](https://github.com/grahamcarlyle/griddle) — macOS window grid utility.

```sh
brew tap grahamcarlyle/tap
brew install --cask griddle
brew upgrade --cask griddle
brew uninstall --cask --zap griddle   # --zap also removes ~/.config/griddle/ and cached prefs
```

## Capsper

[Capsper](https://github.com/danielbodart/capsper) — push-to-talk voice
dictation (macOS Apple Silicon only).

```sh
brew tap grahamcarlyle/tap
brew install grahamcarlyle/tap/capsper
brew upgrade capsper
brew uninstall capsper
```

After the first install, run the upstream interactive setup once to download
speech models and register the background service:

```sh
"$(brew --prefix)/opt/capsper/libexec/install.sh"
```
