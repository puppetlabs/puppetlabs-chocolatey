# ==============================================================================
# Copyright 2011 - Present RealDimensions Software, LLC
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use
# this file except in compliance with the License. You may obtain a copy of the
# License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied. See the License for the
# specific language governing permissions and limitations under the License.
# ==============================================================================
[CmdletBinding()]
Param(
  [string]$DownloadUrl = '',
  [string]$UnzipType = '',
  [string]$InstallProxy = '',
  [string]$SevenZipExe = ''
)

$ErrorActionPreference = 'Stop'

# For some reason try/catch wrapping only ensures
# that none of this script runs at all
# https://tickets.puppetlabs.com/browse/MODULES-2634
#try {

# if a parameter is passed, used that (Bolt task),
#  else fallback to environment variables (Puppet exec resource)
if ($DownloadUrl) {
  $url = $DownloadUrl
} else {
  $url = $env:ChocolateyDownloadUrl
}

if ($UnzipType) {
  $unzipMethod = $UnzipType
} else {
  $unzipMethod = $env:ChocolateyUnzipType
}

if ($InstallProxy) {
  $install_proxy = $InstallProxy
} else {
  $install_proxy = $env:ChocolateyInstallProxy
}

if ($SevenZipExe) {
  $7zaExe = $SevenZipExe
} else {
  $7zaExe = $env:Chocolatey7ZipExe
}

Write-Output "url = $url"
Write-Output "unzipMethod = $unzipMethod"
Write-Output "install_proxy = $install_proxy"
Write-Output "7zaExe = $7zaExe"

if ($env:TEMP -eq $null) {
  $env:TEMP = Join-Path $env:SystemDrive 'temp'
}
$chocTempDir = Join-Path $env:TEMP "chocolatey"
$tempDir = Join-Path $chocTempDir "chocInstall"
if (![System.IO.Directory]::Exists($tempDir)) {[System.IO.Directory]::CreateDirectory($tempDir)}
$file = Join-Path $tempDir "chocolatey.zip"
$chocErrorLog = Join-Path $tempDir "chocError.log"

# PowerShell v2/3 caches the output stream. Then it throws errors due
# to the FileStream not being what is expected. Fixes "The OS handle's
# position is not what FileStream expected. Do not use a handle
# simultaneously in one FileStream and in Win32 code or another
# FileStream."

# This only works with the ConsoleHost (PowerShell InternalHost)
function Fix-PowerShellOutputRedirectionBug {
  try{
    # http://www.leeholmes.com/blog/2008/07/30/workaround-the-os-handles-position-is-not-what-filestream-expected/ plus comments
    $bindingFlags = [Reflection.BindingFlags] "Instance,NonPublic,GetField"
    $objectRef = $host.GetType().GetField("externalHostRef", $bindingFlags).GetValue($host)
    $bindingFlags = [Reflection.BindingFlags] "Instance,NonPublic,GetProperty"
    $consoleHost = $objectRef.GetType().GetProperty("Value", $bindingFlags).GetValue($objectRef, @())
    [void] $consoleHost.GetType().GetProperty("IsStandardOutputRedirected", $bindingFlags).GetValue($consoleHost, @())
    $bindingFlags = [Reflection.BindingFlags] "Instance,NonPublic,GetField"
    $field = $consoleHost.GetType().GetField("standardOutputWriter", $bindingFlags)
    $field.SetValue($consoleHost, [Console]::Out)
    [void] $consoleHost.GetType().GetProperty("IsStandardErrorRedirected", $bindingFlags).GetValue($consoleHost, @())
    $field2 = $consoleHost.GetType().GetField("standardErrorWriter", $bindingFlags)
    $field2.SetValue($consoleHost, [Console]::Error)
  } catch {
    Write-Output "Unable to apply redirection fix. Error: $_"
  }
}

Fix-PowerShellOutputRedirectionBug

# This should help when certain organizations have issues installing Chocolatey
# Attempt to set highest encryption available for SecurityProtocol.
# PowerShell will not set this by default (until maybe .NET 4.6.x). This
# will typically produce a message for PowerShell v2 (just an info
# message though)
try {
  # Set TLS 1.2 (3072) as that is the minimum required by Chocolatey.org.
  # Use integers because the enumeration value for TLS 1.2 won't exist
  # in .NET 4.0, even though they are addressable if .NET 4.5+ is
  # installed (.NET 4.5 is an in-place upgrade).
  [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
} catch {
  Write-Output 'Unable to set PowerShell to use TLS 1.2. This is required for contacting Chocolatey as of 03 FEB 2020. https://chocolatey.org/blog/remove-support-for-old-tls-versions. If you see underlying connection closed or trust errors, you may need to do one or more of the following: (1) upgrade to .NET Framework 4.5+ and PowerShell v3+, (2) Call [System.Net.ServicePointManager]::SecurityProtocol = 3072; in PowerShell prior to attempting installation, (3) specify internal Chocolatey package location (set $env:chocolateyDownloadUrl prior to install or host the package internally), (4) use the Download + PowerShell method of install. See https://chocolatey.org/docs/installation for all install options.'
}

function Download-File {
param (
  [string]$url,
  [string]$file
 )
  Write-Output "Downloading $url to $file"
  $downloader = new-object System.Net.WebClient

  if ($install_proxy) {
    [System.Net.WebRequest]::DefaultWebProxy = New-Object System.Net.WebProxy($install_proxy,$true)
  }

  $downloader.Proxy.Credentials=[System.Net.CredentialCache]::DefaultNetworkCredentials;
  $downloader.DownloadFile($url, $file)
}

# download the package
Download-File $url $file

if ($unzipMethod -eq '7zip') {
  # unzip the package
  Write-Output "Extracting $file to $tempDir..."
  Start-Process "$7zaExe" -ArgumentList "x -o`"$tempDir`" -y `"$file`"" -Wait -NoNewWindow
  Remove-Item -Path "$7zaExe" -Force
} else {
  if ($PSVersionTable.PSVersion.Major -lt 5) {
    $shellApplication = new-object -com shell.application
    $zipPackage = $shellApplication.NameSpace($file)
    $destinationFolder = $shellApplication.NameSpace($tempDir)
    $destinationFolder.CopyHere($zipPackage.Items(),0x10)
  } else {
    Expand-Archive -Path "$file" -DestinationPath "$tempDir" -Force | Out-Null
  }
}

# call chocolatey install
Write-Output "Installing chocolatey on this machine"
$toolsFolder = Join-Path $tempDir "tools"
$chocInstallPS1 = Join-Path $toolsFolder "chocolateyInstall.ps1"

if ($PSVersionTable.PSVersion.Major -gt 2) {
  & $chocInstallPS1
} else {
  $output = Invoke-Expression $chocInstallPS1
  $output
  Write-Output "Any errors that occurred during install or upgrade are logged here: $chocoErrorLog"
  $error | out-file $chocErrorLog
}

Write-Output 'Ensuring chocolatey commands are on the path'
$chocInstallVariableName = "ChocolateyInstall"
$chocoPath = [Environment]::GetEnvironmentVariable($chocInstallVariableName, [System.EnvironmentVariableTarget]::User)
if ($chocoPath -eq $null -or $chocoPath -eq '') {
  $chocoPath = 'C:\ProgramData\Chocolatey'
}

$chocoBinPath = Join-Path $chocoPath 'bin'

if ($($env:Path).ToLower().Contains($($chocoBinPath).ToLower()) -eq $false) {
  $env:Path = [Environment]::GetEnvironmentVariable('Path',[System.EnvironmentVariableTarget]::Machine);
}

Write-Output 'Ensuring chocolatey.nupkg is in the lib folder'
$chocoPkgDir = Join-Path $chocoPath 'lib\chocolatey'
$nupkg = Join-Path $chocoPkgDir 'chocolatey.nupkg'
if (![System.IO.Directory]::Exists($chocoPkgDir)) { [System.IO.Directory]::CreateDirectory($chocoPkgDir); }
Copy-Item "$file" "$nupkg" -Force -ErrorAction SilentlyContinue

#}
#catch
#{
#  Write-Host "$($_.Exception.Message)"
#  exit 1
#}
