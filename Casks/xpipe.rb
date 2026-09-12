cask "xpipe" do
  arch arm: "arm64", intel: "x86_64"
  version "24.2.1"
  desc "Your entire server infrastructure at your fingertips"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg"
  sha256 arm: "09c411d06bb3b0052028c140d232addf65b2933da5a5ab5c1aa6b5b08bde4ec6", intel: "98a0a9992ed44fec97f3ac9a52bd1004bf9e672cce9131e6d0a3ff671fe48421"
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