cask "xpipe-ptb" do
  arch arm: "arm64", intel: "x86_64"
  version "17.0-24"
  desc "XPipe PTB (Public Test Build)"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe-ptb/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg",
      verified: "github.com"
  sha256 arm: "4b5092b3b6be09b61b395b9799b4a2e198fccdaef3d6caf71f3f5043b78b0cb3", intel: "eb65e9c291df8e8aeb688ea5c6d3aef7c7183ec9c13e0bb2fe8789d866fc2d41"
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
