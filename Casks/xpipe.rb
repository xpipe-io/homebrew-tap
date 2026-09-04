cask "xpipe" do
  arch arm: "arm64", intel: "x86_64"
  version "24.0.4"
  desc "Your entire server infrastructure at your fingertips"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg",
      verified: "github.com"
  sha256 arm: "bdb027e20dde97b7ebc9d11cff0d2456cfdd9025d24cdc3effcf8191ccf74b05", intel: "3c648e40b10a631c2d18d64ff3c35910724daa5701dd204dbf2d770f4d2aa13a"
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