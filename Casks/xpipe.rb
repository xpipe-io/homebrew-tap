# Generated with JReleaser 1.6.0 at 2023-05-03T17:24:54.924830831Z
cask "xpipe" do
  desc "A brand-new type of connection manager and remote file explorer."
  homepage "https://github.com/xpipe-io/xpipe"
  url "https://github.com/xpipe-io/xpipe/releases/download/0.5.39/xpipe-installer-macos-x86_64.pkg",
      verified: "github.com"
  version "0.5.39"
  sha256 "a726619ceb181b19aae32e19449158e717a99113b45c8d027a77efad0cd880ff"
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
