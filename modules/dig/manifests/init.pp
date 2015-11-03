class dig {
  file { '/home/michaelc/.digrc':
    ensure => file,
    source => 'puppet:///modules/dig/digrc',
    owner  => 'michaelc',
    group  => 'michaelc',
    mode   => '0644',
  }
}
