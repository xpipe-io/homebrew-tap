# Generated with JReleaser 1.6.0 at 2023-05-03T16:36:25.07919753Z
cask "xpipe" do
  desc "A brand-new type of connection manager and remote file explorer."
  homepage "https://github.com/xpipe-io/xpipe"
  url "https://github.com/xpipe-io/xpipe/releases/download/0.5.39/xpipe-installer-macos-x86_64.pkg",
      verified: "github.com"
  version "0.5.39"
  sha256 "50c4a2d083d7a1477c03709f7bbc927c7c005d2348a5ffc7350c4edcfa0a61b0"
  name "X-Pipe"
  auto_updates true


  pkg "xpipe-installer-macos-x86_64.pkg"
  uninstall script:  {
        executable: "/Applications/X-Pipe.app/Contents/Resources/scripts/uninstall.sh",
        args:       [],
        sudo:       true,
      },
      pkgutil: "io.xpipe.xpipe"
end
