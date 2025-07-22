cask "xpipe-ptb" do
  arch arm: "arm64", intel: "x86_64"
  version "17.3-1"
  desc "XPipe PTB (Public Test Build)"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe-ptb/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg",
      verified: "github.com"
  sha256 arm: "9454d8ae8f9cbc3a465a2a4b9c16bc064f1ade039dcd60dc3f229a62bd4894e1", intel: "5d3c27e376727c1d98782efd630815da5504cda705aa520ac59bb13dc0c8218a"
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
