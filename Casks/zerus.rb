cask "zerus" do
  version "0.48.0"
  sha256 "257113f041c9201cdcddeb97906bf0ffab9295d27ffa9e0697c082197ea6f50e"

  url "https://github.com/ufna/zerus/releases/download/v#{version}/zerus-#{version}-macos-arm64.zip"
  name "Zerus"
  desc "ADE for working with a fleet of AI coding agents"
  homepage "https://zerus.dev/"

  conflicts_with cask: ["zerus@nightly", "zerus@dev"]
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
  EOS
end
