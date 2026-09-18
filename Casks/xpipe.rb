cask "xpipe" do
  arch arm: "arm64", intel: "x86_64"
  version "24.4"
  desc "Your entire server infrastructure at your fingertips"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg"
  sha256 arm: "f4e3c65a8aa42dc42afae3b7acc2e35f6183f142c7d1eb0a51bd7043eab598d9", intel: "e27bb101ff08fe19a8ad5085a84b6da5e998fe3266cd473186eec0b5af1f474c"
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