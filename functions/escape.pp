# @summary Perform escaping and quoting for an install option
#
# Escapes double quotes, and wraps values containing spaces in double quotes.
#
# @param option
#   An install option to be escaped
# @return
function chocolatey::escape(String $option) >> String {
  $option.regsubst('"', '""', 'G')
    .regsubst('^(.*\s.*)$', '"\1"')
}
