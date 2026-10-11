# Zerus Homebrew tap

Homebrew casks for [Zerus](https://github.com/ufna/zerus), the ADE for working
with a fleet of AI coding agents across your machines.

```sh
brew install --cask ufna/zerus/zerus           # stable releases
brew install --cask ufna/zerus/zerus@nightly   # daily verified builds from main
zerus-setup
```

Both casks install the signed and notarized `Zerus.app` and the `hgs` CLI on
Apple Silicon Macs running macOS 14 or later, so only one of them can be
installed. Native agents are installed separately. To switch channels:

```sh
brew uninstall --cask zerus && brew install --cask ufna/zerus/zerus@nightly
brew uninstall --cask zerus@nightly && brew install --cask ufna/zerus/zerus
```

The casks appear here with the first signed Zerus builds. They are generated and
pushed by the Zerus release and nightly workflows from verified candidates. Do not
edit them by hand. Report problems in the
[main repository](https://github.com/ufna/zerus/issues).
