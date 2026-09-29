cask "xpipe-ptb" do
  arch arm: "arm64", intel: "x86_64"
  version "24.5-9"
  desc "Your entire server infrastructure at your fingertips"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe-ptb/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg"
  sha256 arm: "7d2703d6ecab04153d20029c03622642a85bdde0d6efa3258fd514a8a3def2c0", intel: "5576ced33555eb47f4a127752b1b7c4b510c03e316d4c77b0da22f8f869b3bae"
  name "XPipe PTB"
  auto_updates true

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on formula: "util-linux"

  pkg "xpipe-installer-macos-#{arch}.pkg"
  uninstall script:  {
        executable: "/Applications/XPipe PTB.app/Contents/Resources/scripts/uninstall.sh",
        args:       [],
        sudo:       true,
      },
      pkgutil: "io.xpipe.xpipe-ptb"
  zap trash: [
    "~/.xpipe-ptb"
  ]
end