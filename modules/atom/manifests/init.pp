class atom {
  include apt

  apt::ppa { 'http://ppa.launchpad.net/webupd8team/atom/ubuntu': }

  apt::key { 'webupd8team/atom':
    id      => '7B2C3B0889BF5709A105D03AC2518248EEA14886',
    server  => 'ppa.launchpad.net',
  }

  package { 'atom':
    ensure  => latest,
    require => Apt::PPA['http://ppa.launchpad.net/webupd8team/atom/ubuntu'],
  }
}
