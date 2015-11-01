class vim {
  package { 'vim':
    ensure => latest,
  }

  file { '/home/michaelc/.vimrc':
    ensure => file,
    source => 'puppet:///modules/vim/vimrc',
    owner  => 'michaelc',
    group  => 'michaelc',
    mode   => '0644',
  }

  file { '/home/michaelc/.vim/bundle':
    ensure => directory,
    owner  => 'michaelc',
    group  => 'michaelc',
    mode   => '0755',
  }

  file { '/home/michaelc/.vim/autoload':
    ensure => directory,
    owner  => 'michaelc',
    group  => 'michaelc',
    mode   => '0755',
  }

  file { '/home/michaelc/.vim/autoload/pathogen.vim':
    ensure  => file,
    require => File['/home/michaelc/.vim/autoload'],
    source  => 'puppet:///modules/vim/pathogen.vim',
    owner   => 'michaelc',
    group   => 'michaelc',
    mode    => '0644',
  }

  vcsrepo { '/home/michaelc/.vim/bundle/sensible.vim':
    ensure   => present,
    require => File['/home/michaelc/.vim/bundle'],
    provider => git,
    source   => 'git://github.com/tpope/vim-sensible.git',
  }

  vcsrepo { '/home/michaelc/.vim/bundle/nerdtree.vim':
    ensure   => present,
    require  => File['/home/michaelc/.vim/bundle'],
    provider => git,
    source   => 'https://github.com/scrooloose/nerdtree.git',
  }

  vcsrepo { '/home/michaelc/.vim/bundle/puppet.vim':
    ensure   => present,
    require  => File['/home/michaelc/.vim/bundle'],
    provider => git,
    source   => 'git://github.com/rodjek/vim-puppet.git',
  }
}
