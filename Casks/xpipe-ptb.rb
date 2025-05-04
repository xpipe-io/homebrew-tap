cask "xpipe-ptb" do
  arch arm: "arm64", intel: "x86_64"
  version "16.3-4"
  desc "XPipe PTB (Public Test Build)"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe-ptb/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg",
      verified: "github.com"
  sha256 arm: "f90dddf82b75b207a1b5ec813cfb40fff004f54fac46defbc1b2ca299b7eb19f", intel: "3ff31a7b86f0dbdebaf11cc3757bc4a586ccf7dd4c1e2ffc7c96fd69ed4e98f1"
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
