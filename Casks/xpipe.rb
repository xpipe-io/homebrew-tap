cask "xpipe" do
  arch arm: "arm64", intel: "x86_64"
  version "24.1.1"
  desc "Your entire server infrastructure at your fingertips"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg",
      verified: "github.com"
  sha256 arm: "de67a89dfafbb2f1986aeaa3d0c46d2763e5c1b3a6c6eeb4a3bec718cd19fa83", intel: "fd4112c106dfb4a1dde764c3a3930885bd399f88f0a233d80bd03f8ed35a4b72"
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