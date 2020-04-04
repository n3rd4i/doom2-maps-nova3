$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'ftp://ftp.fu-berlin.de/pc/games/idgames/levels/doom2/Ports/megawads/nova3.zip'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$(Join-Path $toolsDir wad)"
  url           = $url
  checksum      = '234DF07D3C13FB97EC43A3ABF129114B2169AF597EF1DB02521CB4DD9BF0814B'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
