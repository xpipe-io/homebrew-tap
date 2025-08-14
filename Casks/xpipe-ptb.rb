cask "xpipe-ptb" do
  arch arm: "arm64", intel: "x86_64"
  version "18.0-16"
  desc "Your entire server infrastructure at your fingertips"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe-ptb/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg",
      verified: "github.com"
  sha256 arm: "cd0ea84455e39dad400e185a3672f6c31c85dad776581a560280a4f3e106a4e6", intel: "f2cb0ce09e0faf80e8606e1ec086e1adcb73c91b124611ccc49a46a508b40a4f"
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