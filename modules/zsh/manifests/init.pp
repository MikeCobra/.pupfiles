class zsh {
  package { 'zsh':
    ensure => latest,
  }

  class { 'ohmyzsh': }

  ohmyzsh::install { 'michaelc': }

  ohmyzsh::theme { [ 'michaelc' ]:
    theme => 'steeef'
  }

  ohmyzsh::plugins { 'michaelc':
    plugins => 'git command-not-found'
  }
}
