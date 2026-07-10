cask "xpipe" do
  arch arm: "arm64", intel: "x86_64"
  version "23.7"
  desc "Your entire server infrastructure at your fingertips"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg",
      verified: "github.com"
  sha256 arm: "57ca44503b87101a091eef32247de5740ada49a3cbcdd10885a4d74c9fb1182b", intel: "b8745ad6c9afee62c02642496840c9ed9ab9c6704a61213bffd74e2703a4ad23"
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