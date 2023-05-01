# Generated with JReleaser 1.6.0 at 2023-05-01T15:39:27.733201041Z
cask "xpipe" do
  desc "A brand-new type of connection manager and remote file explorer."
  homepage "https://github.com/xpipe-io/xpipe"
  url "https://github.com/xpipe-io/xpipe/releases/download/0.5.38/xpipe-installer-macos-x86_64.pkg",
      verified: "github.com"
  version "0.5.38"
  sha256 "6588ab13fa1aa517d3e81edae90921a2adce321b57516df44c15575c4b57c334"
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
