class kde {
  file { '/home/michaelc/.kde/share/config/kdeglobals':
    ensure => file,
    source => 'puppet:///modules/kde/kdeglobals',
    owner  => 'michaelc',
    group  => 'michaelc',
    mode   => '0644',
  }
  ~/.config/plasmarc

  file { '/home/michaelc/.config/plasmarc':
    ensure => file,
    source => 'puppet:///modules/kde/plasmarc',
    owner  => 'michaelc',
    group  => 'michaelc',
    mode   => '0644',
  }

}
