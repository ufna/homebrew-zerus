cask "zerus@nightly" do
  version "0.46.0.r2377.ga951f00.n25"
  sha256 "eab365219469664e985b8164573ecc05071a0fd8ea453a5ee9c193c967b8ea81"

  url "https://github.com/ufna/zerus/releases/download/nightly-39902299008/zerus-#{version}-macos-arm64.zip"
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
