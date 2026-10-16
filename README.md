# Zerus Homebrew tap

Signed and notarized [Zerus](https://github.com/ufna/zerus) builds for Apple Silicon
Macs running macOS 14 or later. Zerus is an ADE for working with a fleet of AI
coding agents across your machines.

For the stable release:

```sh
brew install --cask ufna/zerus/zerus
zerus-setup
```

For the daily verified Nightly, use `ufna/zerus/zerus@nightly` instead.
For Dev builds from successful main CI, use `ufna/zerus/zerus@dev`.

All channels install the same `Zerus.app` and `hgs` CLI, so install only one cask.
Native agents are installed separately. To switch from Dev or Nightly to Stable:

```sh
brew uninstall --cask zerus@dev && brew install --cask ufna/zerus/zerus
# Or from Nightly:
brew uninstall --cask zerus@nightly && brew install --cask ufna/zerus/zerus
```

Update with `brew upgrade --cask zerus` (or the installed Nightly/Dev cask).
**Settings > Updates** checks the selected channel, shows the installed build,
and provides an update command and a DMG download. Installation and GUI restart
remain explicit; native agents and tmux sessions keep running.

Stable and Nightly downloads are immutable GitHub Release assets. Dev
uses verified, immutable files on the existing zerus.dev mirror with bounded
retention, without a GitHub Release per push. The publication workflows verify
candidate provenance and public download hashes before updating the casks.
Do not edit generated casks by hand. See the
[installation guide](https://github.com/ufna/zerus/blob/main/docs/installation.md#macos-homebrew)
and report problems in the [main repository](https://github.com/ufna/zerus/issues).
