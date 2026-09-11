cask "xpipe" do
  arch arm: "arm64", intel: "x86_64"
  version "24.2"
  desc "Your entire server infrastructure at your fingertips"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg"
  sha256 arm: "d82f3b053a01e64f391a4e6c1e82e79409d604e1e17850816cd31b4ff377faa8", intel: "99eb211689c6d9b7f5b2b63bf13543e3898aa47ad8af4893c6f38683e5624bf1"
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