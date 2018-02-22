# profile
#
# @summary Components used to construct roles.
class profile::base {
  case $facts['kernel'] {
    'windows': {
      include profile::windows::base
    }
    default: { }
  }
}
