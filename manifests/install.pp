# @summary Handles installation of Chocolatey
#
# @api private
class chocolatey::install {
  assert_private()

  $_download_url = $chocolatey::chocolatey_download_url

  # lint:ignore:only_variable_string
  if "${_download_url}" =~ /^http(s)?:\/\/.*api\/v2\/package.*\/$/ and "${chocolatey::chocolatey_version}" =~ /\d+\./ {
    # Assume a nuget server source and we want to download a specific version instead the most current
    $download_url = "${_download_url}${chocolatey::chocolatey_version}"
  } else {
    $download_url = $_download_url
  }
  # lint:endignore

  registry_value { 'ChocolateyInstall environment value':
    ensure => present,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\ChocolateyInstall',
    type   => 'string',
    data   => $chocolatey::choco_install_location,
  }

  # New install script exclusively uses environment variables in powershell.
  # Filter out undef values and build an array of ['key=value'] to be passed in to the execs environment attribute.
  # The 'chocolateyVersion' can also be passed to the install script. Instead only pass an explicit 'chocolateyDownloadUrl' that we
  # already build correctly if $chocolatey::chocolatey_version is set. This allows for a custom $chocolatey:chocolatey_download_url
  # to be used with no modification to the script. If the version is unset, the default behavior remains the same which is to attempt
  # to install the latest available version.
  $install_parameters = {
    'ChocolateyInstall'               => $chocolatey::choco_install_location,
    'chocolateyDownloadUrl'           => $download_url,
    'chocolateyProxyLocation'         => $chocolatey::install_proxy,
    'chocolateyProxyUser'             => $chocolatey::install_proxy_user,
    'chocolateyProxyPassword'         => $chocolatey::install_proxy_password.unwrap,
    'chocolateyIgnoreProxy'           => $chocolatey::install_ignore_proxy,
    # install script defaults to using 7zip, this module defaults to using windows compression.
    # this is ignored by install script if $PSVersionTable.PSVersion >= 5
    'chocolateyUseWindowsCompression' => $chocolatey::use_7zip ? {
      true    => false,
      false   => true,
    },
    'TEMP'                            => $chocolatey::install_tempdir,
  }.filter |$k, $v| { $v != undef }.map |$k, $v| { join([$k, $v], '=') }

  # install.ps1 obtained from: https://community.chocolatey.org/install.ps1
  # Lightly modified to allow a custom $seven_zip_download_url. This has the benefit of using the same proxy
  # if configured to use a proxy. For this module this is also a change in behavior as previously this was managed
  # as a separate File resource.
  # Since it was modified the [SIG] block was also removed
  exec { 'install_chocolatey_official':
    command     => epp('chocolatey/install.ps1.epp'),
    creates     => "${chocolatey::choco_install_location}\\bin\\choco.exe",
    provider    => powershell,
    timeout     => $chocolatey::choco_install_timeout_seconds,
    logoutput   => $chocolatey::log_output,
    environment => $install_parameters,
    require     => Registry_value['ChocolateyInstall environment value'],
  }
}
