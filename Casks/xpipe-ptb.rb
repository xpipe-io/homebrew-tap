cask "xpipe-ptb" do
  arch arm: "arm64", intel: "x86_64"
  version "16.3-8"
  desc "XPipe PTB (Public Test Build)"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe-ptb/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg",
      verified: "github.com"
  sha256 arm: "c4d5d22f8c69cc920d4939ea848ab90c7d465187f81d59035cd3c2345c4fd3ff", intel: "b010b7fd38dfbae9fa1bd1d56edf2e3c673b95e889061601094d73e303924402"
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
