cask "xpipe" do
  arch arm: "arm64", intel: "x86_64"
  version "24.8"
  desc "Your entire server infrastructure at your fingertips"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg"
  sha256 arm: "6e23026ade7a8f3db34503c747b239bd3c7a81dd9d503e9c4c42cc8ee8e9cce1", intel: "4bf7b78028a3d5e794856993e8253a0481d9fa662c5ba3be59f525683995ec17"
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