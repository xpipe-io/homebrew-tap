cask "xpipe-ptb" do
  arch arm: "arm64", intel: "x86_64"
  version "25.0-1"
  desc "Your entire server infrastructure at your fingertips"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe-ptb/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg"
  sha256 arm: "43d06127a3049885c5f9be621059bfa7bd97d9dce470232676aad22520731ddc", intel: "a3e88d96cabb647f6413578122203fe58f23d0109a690003b88b5b1349df31e6"
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