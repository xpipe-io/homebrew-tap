cask "xpipe-ptb" do
  arch arm: "arm64", intel: "x86_64"
  version "16.0-36"
  desc "XPipe PTB (Public Test Build)"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe-ptb/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg",
      verified: "github.com"
  sha256 arm: "fbb441fe60faa6c8697a02a4bcaf382defa4d88cec16bd2bf90c565344d1e8c6", intel: "68b1dbfb8023fa12d6c8ded09e2d3fa7707b1ab93a6cfb6fd9d6c815c4f6e2a8"
  name "XPipe PTB"
  auto_updates true

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on formula: "util-linux"

  pkg "xpipe-installer-macos-#{arch}.pkg"
  uninstall script:  {
        executable: "/Applications/XPipe PTB.app/Contents/Resources/scripts/uninstall.sh",
        args:       [],
        sudo:       true,
      },
      pkgutil: "io.xpipe.xpipe-ptb"
  zap trash: [
    "~/.xpipe-ptb"
  ]
end
