cask "xpipe-ptb" do
  arch arm: "arm64", intel: "x86_64"
  version "18.0-27"
  desc "Your entire server infrastructure at your fingertips"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe-ptb/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg",
      verified: "github.com"
  sha256 arm: "f1e95fbaf8ec1fb31ec9b0e0d9864ffbaacd4b855ffbf2d6f0e5493d7522d5a8", intel: "a5b7f216b2b51fda77ed5016ed382d63682a3a9379d6492c1ab8eca3cfca9e7e"
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