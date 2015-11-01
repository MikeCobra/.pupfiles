class atom {
  include apt

  apt::ppa { 'http://ppa.launchpad.net/webupd8team/atom/ubuntu': }

  package { 'atom':
    ensure  => latest,
    require => Apt::PPA['http://ppa.launchpad.net/webupd8team/atom/ubuntu'],
  }
}
