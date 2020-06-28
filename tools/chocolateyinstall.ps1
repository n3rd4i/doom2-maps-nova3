$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$toolsDir\commonEnv.ps1"

$url        = 'ftp://ftp.fu-berlin.de/pc/games/idgames/levels/doom2/Ports/megawads/nova3.zip'
$unzipLocation = "$(Join-Path $toolsDir wad)"
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $unzipLocation
  url           = $url
  checksum      = '234DF07D3C13FB97EC43A3ABF129114B2169AF597EF1DB02521CB4DD9BF0814B'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

# Cleanup link first (safely)
& $ENV:COMSPEC /C IF EXIST $wad_lnk DEL /S /Q $wad_lnk

# Install symbolic link for later use
$wad_src = "$(Join-Path $unzipLocation $wad)"
& $ENV:COMSPEC /C MKLINK $wad_lnk $wad_src
