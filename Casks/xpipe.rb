cask "xpipe" do
  arch arm: "arm64", intel: "x86_64"
  version "16.2.1"
  desc "Your entire server infrastructure at your fingertips"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg",
      verified: "github.com"
  sha256 arm: "fb7d905cd5f9f20586a4a4b0d041f314fd9494e37af32a1e2dee8c210cce8244", intel: "7f832d592c9960da62e4b2bc5fe28f3eb11bf485db974d51a99c6cd4b4dc389f"
  name "XPipe"
  auto_updates true

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on formula: "util-linux"

  pkg "xpipe-installer-macos-#{arch}.pkg"
  uninstall script:  {
        executable: "/Applications/XPipe.app/Contents/Resources/scripts/uninstall.sh",
        args:       [],
        sudo:       true,
      },
      pkgutil: "io.xpipe.xpipe"
  zap trash: [
    "~/.xpipe"
  ]
end
