cask "xpipe" do
  arch arm: "arm64", intel: "x86_64"
  version "22.8"
  desc "Your entire server infrastructure at your fingertips"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg",
      verified: "github.com"
  sha256 arm: "4d75a493b64c7fecaaf1cb4e63a036ebd6091fbb10e3eb051558d252622df5dd", intel: "d857f3a4dde2e821a3e47d99db2d9c4969dd77c35c6e8a61e9d362c0fc4e6e29"
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