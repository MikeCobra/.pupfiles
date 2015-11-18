class myrvm {
  class { '::rvm': }

  rvm::system_user { 'michaelc': ; }

  rvm_system_ruby {
    'ruby-1.9':
      ensure      => 'present',
      default_use => false;
    'ruby-2.2':
      ensure      => 'present',
      default_use => true;
  }
}
