class atom {
  package { 'atom':
    ensure   => installed,
    provider => 'dpkg',
    source   => 'https://github.com/atom/atom/releases/download/v1.1.0/atom-amd64.deb',
  }
}
