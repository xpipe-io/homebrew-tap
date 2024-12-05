cask "xpipe" do
  arch arm: "arm64", intel: "x86_64"
  version "13.4.2"
  desc "Your entire server infrastructure at your fingertips"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg",
      verified: "github.com"
  sha256 arm: "554dc10e1bf37b7ae3572ac0281d8424f08ed96648a15a3744e44ed62d3a8a74", intel: "2d8a391150229711248ed342e9ab8dcf672b21acf2589a21e4eee4c98e0694b4"
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
