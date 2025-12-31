cask "xpipe" do
  arch arm: "arm64", intel: "x86_64"
  version "20.1"
  desc "Your entire server infrastructure at your fingertips"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg",
      verified: "github.com"
  sha256 arm: "04270a0dc4d4bf0748030afe04f2e50b4d806cf5b4a2a3f281bb374b2ad2aed1", intel: "ac4adb92427f1041e2ddebf3d3c05ad88a5cfb42b60d5f2c811f80acaa5a7f6e"
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