cask "xpipe-ptb" do
  arch arm: "arm64", intel: "x86_64"
  version "16.3-16"
  desc "XPipe PTB (Public Test Build)"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe-ptb/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg",
      verified: "github.com"
  sha256 arm: "ff7c753efab5b5fc31771ad97ba08c3e5220928a13bb03bdfe0615b6cad2cc3c", intel: "cdae5bc1ff4583fa0b98001ca635f9ea8e0ebe1e59f9763d73f227cf5a75a5ee"
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
