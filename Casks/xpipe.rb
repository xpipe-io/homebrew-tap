cask "xpipe" do
  arch arm: "arm64", intel: "x86_64"
  version "16.4"
  desc "Your entire server infrastructure at your fingertips"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg",
      verified: "github.com"
  sha256 arm: "ad9fbcc39cdbc6505b371c8aac5b4cc5c49c7591e0b14eed0c21eb2e79d7f8a1", intel: "4a3aa3c232a9551ed0357b3cf7c4ed84bababd5a92ea6b8cd1a566e731b11280"
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
