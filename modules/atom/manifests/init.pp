class atom {
  include apt

  apt::ppa { 'ppa:webupd8team/atom': }

  apt::key { 'ppa:webupd8team/atom':
    id => '7B2C3B0889BF5709A105D03AC2518248EEA14886',
  }

  package { 'atom':
    ensure  => latest,
    require => [
      Apt::PPA['ppa:webupd8team/atom'],
      Apt::Key['ppa:webupd8team/atom'],
    ],
    notify  => Exec['atom-permissions'],
  }

  package { 'puppet-lint':
    ensure   => latest,
    provider => 'gem'
  }

  package { 'language-puppet':
    ensure   => latest,
    require  => Package['atom'],
    provider => 'apm',
    notify   => Exec['atom-permissions'],
  }

  package { 'linter-puppet-lint':
    ensure   => latest,
    require  => Package['atom'],
    provider => 'apm',
    notify   => Exec['atom-permissions'],
  }

  package { 'base16-syntax':
    ensure   => latest,
    require  => Package['atom'],
    provider => 'apm',
    notify   => Exec['atom-permissions'],
  }

  exec { 'atom-permissions':
    command => '/bin/chown -R michaelc:michaelc /home/michaelc/.atom',
    refreshonly => true,
  }

  file { '/home/michaelc/.atom/config.cson':
    ensure => file,
    source => 'puppet:///modules/atom/config.cson',
    owner  => 'michaelc',
    group  => 'michaelc',
    mode   => '0644',
  }

  file { '/home/michaelc/.atom/styles.less':
    ensure => file,
    source => 'puppet:///modules/atom/styles.less',
    owner  => 'michaelc',
    group  => 'michaelc',
    mode   => '0644',
  }

  file { '/home/michaelc/.atom/packages/base16-syntax/styles/schemes/yesterday-bright.less':
    ensure => file,
    source => 'puppet:///modules/atom/yesterday-bright.less',
    owner  => 'michaelc',
    group  => 'michaelc',
    mode   => '0644',
  }

  file_line { 'yesterday-bright':
    path  => '/home/michaelc/.atom/packages/base16-syntax/lib/base16-settings.coffee',
    line  => '        "Yesterday Bright"',
    after => '        "Twilight",',
  }
}
