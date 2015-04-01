class profiles::nux_desktop (
  $nux_enable    = '1',
  $nux_exclude   = '',
  $nux_include   = '',
  $testing_enable   = '0',
  $testing_exclude  = '',
  $testing_include  = '',
) {

  case $::osfamily {
    'RedHat': {
      yumrepo { 'nux-desktop':
        baseurl     => "http://li.nux.ro/download/nux/dextop/el${::operatingsystemmajrelease}/\$basearch/ http://mirror.li.nux.ro/li.nux.ro/nux/dextop/el${::operatingsystemmajrelease}/\$basearch/",
        enabled     => $nux_enable,
        exclude     => $nux_exclude,
        includepkgs => $nux_include,
        gpgcheck    => '1',
        gpgkey      => 'http://li.nux.ro/download/nux/RPM-GPG-KEY-nux.ro',
        descr       => 'Nux.Ro RPMs for general desktop use',
      }

      yumrepo { 'nux-desktop-testing':
        baseurl     => "http://li.nux.ro/download/nux/dextop-testing/el${::operatingsystemmajrelease}/\$basearch/",
        enabled     => $testing_enable,
        exclude     => $testing_exclude,
        includepkgs => $testing_include,
        gpgcheck    => '1',
        gpgkey      => 'http://li.nux.ro/download/nux/RPM-GPG-KEY-nux.ro',
        descr       => 'Nux.Ro RPMs for general desktop use - testing',
      }
    }
    default: { fail("${::osfamily} is not supported.") }
  }
}
