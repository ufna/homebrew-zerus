cask "zerus" do
  version "0.48.3"
  sha256 "7cc26bfd043f089dd4295d5bf2f3aa30caebea71006c867cb4a87ed78161f6b4"

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
