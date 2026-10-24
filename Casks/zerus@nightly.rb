cask "zerus@nightly" do
  version "0.47.0.r2451.g8044363.n26"
  sha256 "346a8aad13afaada00b110b6be5a59f7c3c9e52cc2666f8141d4f712744d15a8"

  url "https://github.com/ufna/zerus/releases/download/nightly-40062965589/zerus-#{version}-macos-arm64.zip"
  name "Zerus Nightly"
  desc "Daily build of the ADE for working with a fleet of AI coding agents"
  homepage "https://zerus.dev/"

  conflicts_with cask: "zerus"
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
    This is the daily build from main. To switch to stable releases:
      brew uninstall --cask zerus@nightly && brew install --cask ufna/zerus/zerus
  EOS
end
