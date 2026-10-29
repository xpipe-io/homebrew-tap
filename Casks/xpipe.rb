cask "xpipe" do
  arch arm: "arm64", intel: "x86_64"
  version "24.10"
  desc "Your entire server infrastructure at your fingertips"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg"
  sha256 arm: "8dea8192715c3df19166a907b71b75a6fb59cf70a65337ea7ac9dda0c7d47d1b", intel: "2d38ee71f756c098d533cdfe633fde2153422cc6bb4d19ca3f49bb55184b963c"
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