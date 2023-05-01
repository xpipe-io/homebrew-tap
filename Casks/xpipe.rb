# Generated with JReleaser 1.6.0 at 2023-05-01T11:08:20.788293+02:00
cask "xpipe" do
  desc "A brand-new type of connection manager and remote file explorer."
  homepage "https://github.com/xpipe-io/xpipe"
  url "https://github.com/xpipe-io/xpipe_staging/releases/download/0.5.38/xpipe-installer-macos-x86_64.pkg",
      verified: "github.com"
  version "0.5.38"
  sha256 "cb7dc42840c030771a006cba95d89654f3125080416b444241c2e199d4cbe54e"
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
