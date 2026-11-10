cask "zerus@dev" do
  version "0.49.1-dev.2919"
  sha256 "ddc778efdfc9a597c2e32428841ae3e90f62afdbe06dc7d27685eae70a7738f1"

  url "https://zerus.dev/downloads/dev-desktop-42737887034/zerus-#{version}-macos-arm64.zip"
  name "Zerus Dev"
  desc "Verified main build of the ADE for working with a fleet of AI coding agents"
  homepage "https://zerus.dev/"

  conflicts_with cask: ["zerus", "zerus@nightly"]
  depends_on arch: :arm64
  depends_on formula: "tmux"
  depends_on macos: :sonoma

  app "Zerus.app"
  binary "#{appdir}/Zerus.app/Contents/MacOS/hgs"
  binary "#{appdir}/Zerus.app/Contents/Resources/bin/zerus-setup"

  caveats <<~EOS
    Run this once as your user, without sudo:
      zerus-setup
    It creates ~/.local/bin/hgs for SSH and the Keychain session bridge.
    Optional: zerus-setup --autostart --workers
    Before uninstalling: zerus-setup --remove
    This channel follows verified main builds. To switch to nightly:
      brew uninstall --cask zerus@dev && brew install --cask ufna/zerus/zerus@nightly
  EOS
end
