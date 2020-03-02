[CmdletBinding()]
Param(
  [string]$download_url = 'https://chocolatey.org/api/v2/package/chocolatey/',
  [boolean]$use_7zip = $False,
  [string]$install_proxy = '',
  [string]$seven_zip_exe = "C:\Windows\Temp\7za.exe",
  [String]$_installdir
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

if ($use_7zip) {
  $unzip_type = '7zip'
} else {
  $unzip_type = 'windows'
}

& "$_installdir\chocolatey\files\InstallChocolatey.ps1" -DownloadUrl $download_url -UnzipType $unzip_type -InstallProxy $install_proxy -SevenZipExe "$seven_zip_exe"
