# Generated with JReleaser 1.6.0 at 2023-05-01T11:19:49.135563451Z
cask "xpipe" do
  desc "A brand-new type of connection manager and remote file explorer."
  homepage "https://github.com/xpipe-io/xpipe"
  url "https://github.com/xpipe-io/xpipe/releases/download/0.5.38/xpipe-installer-macos-x86_64.pkg",
      verified: "github.com"
  version "0.5.38"
  sha256 "aac9cc0995f7d871e518ae8219a787908357f749866d99979cbc05c74ee2428b"
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
