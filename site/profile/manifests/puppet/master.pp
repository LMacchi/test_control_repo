# profile::puppet::master
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include profile::puppet::master
class profile::puppet::master (
  String $puppet_autosign_shared_secret = "Blah",
  Hash $puppet_tagmail_users = {},
)  {
  file { '/etc/puppetlabs/puppet/autosign.rb':
    ensure  => file,
    owner   => 'pe-puppet',
    group   => 'pe-puppet',
    mode    => '0700',
    content => template('profile/puppet/autosign.rb.erb'),
    notify  => Service['pe-puppetserver'],
  }

  ini_setting { 'autosign script setting':
    ensure  => present,
    path    => '/etc/puppetlabs/puppet/puppet.conf',
    section => 'master',
    setting => 'autosign',
    value   => '/etc/puppetlabs/puppet/autosign.rb',
    notify  => Service['pe-puppetserver'],
  }

  ini_setting { 'tagmail tagmap':
    ensure  => present,
    path    => '/etc/puppetlabs/puppet/puppet.conf',
    section => 'master',
    setting => 'tagmap',
    value   => '/etc/puppetlabs/puppet/tagmail.conf',
  }

  ini_setting { 'tagmail reports':
    ensure  => present,
    path    => '/etc/puppetlabs/puppet/puppet.conf',
    section => 'master',
    setting => 'reports',
    value   => 'puppetdb,tagmail',
    notify  => Service['pe-puppetserver'],
  }
}
