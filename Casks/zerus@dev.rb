cask "zerus@dev" do
  version "0.47.1-dev.1595"
  sha256 "609c1dda201e667e5c30d5fdd5cc5b1bcf92ed432e57e440f69887639ceb95e7"

  url "https://zerus.dev/downloads/dev-desktop-40996879187/zerus-#{version}-macos-arm64.zip"
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
        "com.hgdev.zerus-mobile-connector",
      ],
      trash:     [
        "~/Library/LaunchAgents/com.hgdev.hgs-recovery.plist",
        "~/Library/LaunchAgents/com.hgdev.hgs-swarm.plist",
        "~/Library/LaunchAgents/com.hgdev.hgs-tray.plist",
        "~/Library/LaunchAgents/com.hgdev.hgs.user-session.plist",
        "~/Library/LaunchAgents/com.hgdev.zerus-mobile-connector.plist",
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
