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

  package { 'language-puppet':
    ensure   => latest,
    require  => Package['atom'],
    provider => 'apm',
    notify   => Exec['atom-permissions'],
  }

  exec { 'atom-permissions':
    command => 'chown -R michaelc:michaelc /home/michaelc/.atom',
    refreshonly => true,
  }
}
