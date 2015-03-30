class profiles::puppet (
) {

  include '::puppet'

  Class['profiles::puppet'] -> Class['puppet']

  # Manage the puppetlabs repo's

  case $::osfamily {
    'RedHat': {
      if $::operatingsystem == 'Fedora' {
        $ostype='fedora'
        $prefix='f'
      } else {
          $ostype='el'
          $prefix=''
      }
      yumrepo { 'puppetlabs-deps':
        baseurl  => "http://yum.puppetlabs.com/${ostype}/${prefix}\$releasever/dependencies/\$basearch",
        descr    => 'Puppet Labs Dependencies $releasever - $basearch ',
        enabled  => '1',
        gpgcheck => '1',
        gpgkey   => 'http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs',
      }

      yumrepo { 'puppetlabs':
        baseurl  => "http://yum.puppetlabs.com/${ostype}/${prefix}\$releasever/products/\$basearch",
        descr    => 'Puppet Labs Products $releasever - $basearch',
        enabled  => '1',
        gpgcheck => '1',
        gpgkey   => 'http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs',
      }
    }
    'Debian': {
      apt::key { 'puppetlabs':
        key        => '4BD6EC30',
        key_source => 'http://apt.puppetlabs.com/keyring.gpg',
      }
      #Apt::Source {
      #  location    => 'http://apt.puppetlabs.com',
      #}
      $apt_location = 'http://apt.puppetlabs.com'
      apt::source { 'puppetlabs':      repos => 'main', location => $apt_location }
      apt::source { 'puppetlabs-deps': repos => 'dependencies', location => $apt_location }
    }
    default: { fail("Unsupported osfamily ${::osfamily}") }

  }

}
