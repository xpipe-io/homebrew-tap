$toolsDir   = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'xpipe'
  fileType      = 'msi'
  url           = 'https://github.com/xpipe-io/xpipe/releases/download/18.0-6-SNAPSHOT/xpipe-installer-windows-x86_64.msi'
  silentArgs    = "/quiet"
  validExitCodes= @(0)
  softwareName  = 'xpipe*'
  checksum      = '013867c733e632e618695f97368d54b6311cb4c5298bd65fb7db7933c229ef53'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs