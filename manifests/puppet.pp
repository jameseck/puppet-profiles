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
      Apt::Source {
        location    => 'http://apt.puppetlabs.com',
        key         => '4BD6EC30',
        key_content => template('puppet/pgp.key'),
      }
      apt::source { 'puppetlabs':      repos => 'main' }
      apt::source { 'puppetlabs-deps': repos => 'dependencies' }
    }
    default: { fail("Unsupported osfamily ${::osfamily}") }

  }

}
