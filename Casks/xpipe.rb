cask "xpipe" do
  arch arm: "arm64", intel: "x86_64"
  version "24.13"
  desc "Your entire server infrastructure at your fingertips"
  homepage "https://xpipe.io"
  url "https://github.com/xpipe-io/xpipe/releases/download/#{version}/xpipe-installer-macos-#{arch}.pkg"
  sha256 arm: "205b1988b4b515c16a1e603d8cc4067eef66e0f1b13b2c437dd157e9678af6a2", intel: "f5882fcb2e9b70d44330dfce316acbfbf1ee478d296116524466562d0f13ed67"
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