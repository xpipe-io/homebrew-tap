cask "xpipe" do
  arch arm: "arm64", intel: "x86_64"
  version "23.0"
  desc "Your entire server infrastructure at your fingertips"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg",
      verified: "github.com"
  sha256 arm: "6ad0c44b71275b8446dc7b3fc14bff9b6eb7619af9ffc52723dd83ba85d073fb", intel: "c85f9411bf012a8016cbf9fec13c7f8ca3edc40a8e943c2a4377c37a12b6ec62"
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