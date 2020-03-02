[CmdletBinding()]
Param(
  [string]$command = '',
  [string]$name = '',
  [string]$location = '',
  [string]$user = '',
  [string]$password = '',
  [int]$priority = 0,
  [boolean]$bypass_proxy = $false,
  [boolean]$allow_self_service = $false,
  [boolean]$admin_only = $false,
  [string]$_task
)

if ($command -eq '') {
  # $_task will be something like 'chocolatey::source_xxx'
  # we want to extract the 'xxx' from the end as that's our command
  $task_parts = $_task -split "chocolatey\:\:source_"
  # parts[0] = ''
  # parts[1] = 'xxx'
  $command = $task_parts[1]
}

$cmd = @('choco', 'source', $command, '--limit-output', '--no-progress')

if ($command -ne 'list') {
  $cmd += @('--name', $name)
}

if ($command -eq 'add') {
  $cmd += @('--source', $location)

  if ($user -ne '') {
    $cmd += @('--user', $user)
    $cmd += @('--password', $password)
  }

  if ($bypass_proxy) {
    $cmd += @('--bypass-proxy')
  }

  if ($allow_self_service) {
    $cmd += @('--allow-self-service')
  }

  if ($admin_only) {
    $cmd += @('--admin-only')
  }

  $cmd += @('--priority', "$priority")
}

$cmd_str = $cmd -join ' '
iex "& $cmd_str"
