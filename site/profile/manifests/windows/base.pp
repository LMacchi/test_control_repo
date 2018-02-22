# profile::windows::base
#
# @summary Common to all windows nodes.
class profile::windows::base {
  ##
  # Windows Packages
  #
  # JFrog and 7Zip required for Artifactory and Archive module use.
  #
  file  { '7z1701-x64.msi':
    ensure => present,
    path   => 'C:/Windows/Temp/7z1701-x64.msi',
    source => 'puppet:///modules/profile/7z1701-x64.msi',
    mode   => '0777',
  }
}
