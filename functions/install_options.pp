# @summary Perform escaping, and splitting of a number of install options
#
# @example
#   package {'mysql':
#     ensure          => latest,
#     provider        => 'chocolatey',
#     install_options => chocolatey::install_options(
#       '-override',
#       '-installArgs',
#       "/INSTALLDIR=${chocolatey::escape('C:\Program Files\somewhere'}",
#     ),
#   }
#
# @param options
#   An install option to be escaped
# @return
function chocolatey::install_options(Array[String] *$options) >> Array[String] {
  $options.map |$option| {
    chocolatey::escape($option)
  }.reduce([]) |$memo, $option| {
    $memo + $option.split(' ')
  }
}
