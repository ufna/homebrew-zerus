cask "zerus@dev" do
  version "0.44.1-dev.809"
  sha256 "c9786686d7a08ed5097a1d06167aac64edbb8e0cc1c6919b906aa0d94c395b6d"

  url "https://zerus.dev/downloads/dev-desktop-38978441681/zerus-#{version}-macos-arm64.zip"
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

  zap launchctl: [
        "com.hgdev.hgs-recovery",
        "com.hgdev.hgs-swarm",
        "com.hgdev.hgs-tray",
        "com.hgdev.hgs.user-session",
      ],
      trash:     [
        "~/Library/LaunchAgents/com.hgdev.hgs-recovery.plist",
        "~/Library/LaunchAgents/com.hgdev.hgs-swarm.plist",
        "~/Library/LaunchAgents/com.hgdev.hgs-tray.plist",
        "~/Library/LaunchAgents/com.hgdev.hgs.user-session.plist",
        "~/Library/Logs/hgs",
        "~/Library/Logs/hgs-tray.log",
        "~/Library/Saved Application State/com.hgdev.hgs-tray.savedState",
      ]

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
