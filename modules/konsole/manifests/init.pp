class konsole {
  file { '/home/michaelc/.local/share/konsole/base16-yesterdaybright.colorscheme':
    ensure => file,
    source => 'puppet://modules/konsole/base16-yesterdaybright.colorscheme',
    owner  => 'michaelc',
    group  => 'michaelc',
    mode   => '0644',
  }

  file { '/home/michaelc/.local/share/konsole/Shell.profile':
    ensure => file,
    source => 'puppet://modules/konsole/Shell.profile',
    owner  => 'michaelc',
    group  => 'michaelc',
    mode   => '0644',
  }
}
