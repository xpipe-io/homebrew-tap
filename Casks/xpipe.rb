cask "xpipe" do
  arch arm: "arm64", intel: "x86_64"
  version "13.4"
  desc "Your entire server infrastructure at your fingertips"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg",
      verified: "github.com"
  sha256 arm: "93bbc42c5ef931658debb5b9197b3c13e4da94694797a7dc540bc4f9f86a134e", intel: "103db291c598333583b5d8ad26f84855dd9a5b227e92843f27d9fca881716a1c"
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
