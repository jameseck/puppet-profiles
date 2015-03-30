class profiles::atrpms (
  $atrpms_enable    = true,
  $atrpms_exclude   = '',
  $atrpms_include   = '',
  $testing_enable   = false,
  $testing_exclude  = '',
  $testing_include  = '',
  $bleeding_enable  = false,
  $bleeding_exclude = '',
  $bleeding_include = '',
) {


  case $::osfamily {
    'RedHat': {
      yumrepo { 'atrpms':
        baseurl     => "http://dl.atrpms.net/el${::operatingsystemmajrelease}-${::architecture}/atrpms/stable",
        proxy       => $atrpms::params::proxy,
        enabled     => $atrpms_enable,
        exclude     => $atrpms_exclude,
        includepkgs => $atrpms_include,
        gpgcheck    => '1',
        gpgkey      => 'http://packages.atrpms.net/RPM-GPG-KEY.atrpms',
        descr       => "ATrpms packages for Enterprise Linux ${::operatingsystemmajrelease} - ${::architecture}",
      }

      yumrepo { 'atrpms-testing':
        baseurl     => "http://dl.atrpms.net/el${::operatingsystemmajrelease}-${::architecture}/atrpms/testing",
        proxy       => $atrpms::params::proxy,
        enabled     => $testing_enable,
        exclude     => $testing_exclude,
        includepkgs => $testing_include,
        gpgcheck    => '1',
        gpgkey      => 'http://packages.atrpms.net/RPM-GPG-KEY.atrpms',
        descr       => "ATrpms testing packages for Enterprise Linux ${::operatingsystemmajrelease} - ${::architecture}",
      }

      yumrepo { 'atrpms-bleeding':
        baseurl     => "http://dl.atrpms.net/el${::operatingsystemmajrelease}-${::architecture}/atrpms/bleeding",
        proxy       => $atrpms::params::proxy,
        enabled     => $bleeding_enable,
        exclude     => $bleeding_exclude,
        includepkgs => $bleeding_include,
        gpgcheck    => '1',
        gpgkey      => 'http://packages.atrpms.net/RPM-GPG-KEY.atrpms',
        descr       => "ATrpms bleeding edge packages for Enterprise Linux ${::operatingsystemmajrelease} - ${::architecture}",
      }
    }
    default: { fail("${::osfamily} is not supported.") }
  }
}
