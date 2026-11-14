cask "xpipe" do
  arch arm: "arm64", intel: "x86_64"
  version "24.11"
  desc "Your entire server infrastructure at your fingertips"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg"
  sha256 arm: "04fa420e3ac88f962ebd0f42df42c6a3dbd15d4003ed571f7e1dbf7b9ffd4f58", intel: "54e5500a9ef12672546adfbe34f0e8067dab75ecb26b5ccc02200d6d562ced8c"
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