class profiles::sonar_repo (
) {

  case $::osfamily {
    'RedHat': {
      yumrepo { 'sonar':
        descr    => 'Sonar',
        baseurl  => 'http://downloads.sourceforge.net/project/sonar-pkg/rpm',
        gpgcheck => false,
      }
    }
    default: { fail("osfamily ${::osfamily} is not supported") }
  }

}
