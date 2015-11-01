class kde {
  file { '/home/michaelc/.kde/share/config/kdeglobals':
    ensure => file,
    source => 'puppet:///modules/kde/kdeglobals',
    owner  => 'michaelc',
    group  => 'michaelc',
    mode   => '0644',
  }
}
