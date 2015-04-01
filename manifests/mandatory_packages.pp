class profiles::mandatory_packages (
) {

  anchor { 'profiles::mandatory_packages::begin': }

  case $::osfamily {
    'RedHat': {
      case $::operatingsystemmajrelease {
        /^5.*/: {
          $packages = [
            'augeas',
            'strace',
            'yum-utils',
            'tcpdump',
            'screen',
            'sysstat',
            'vim-enhanced',
            'dmidecode',
            'telnet',
            'wget',
            'curl',
            'policycoreutils',
            'bash-completion',
          ]
        }
        /^[67].*/: {
          $packages = [
            'augeas',
            'strace',
            'yum-utils',
            'tcpdump',
            'screen',
            'sysstat',
            'vim-enhanced',
            'dmidecode',
            'telnet',
            'wget',
            'curl',
            'psmisc',
            'policycoreutils-python',
            'bash-completion',
            'ipmitool',
          ]
        }
        default: { fail("operatingsystemmajrelease ${::operatingsystemmajrelease} not supported") }
      }
    }
    'Debian': {
      $packages = [
        'augeas-tools',
        'strace',
        'tcpdump',
        'screen',
        'sysstat',
        'vim-nox',
        #'dmidecode', # Not availble on rasbian
        'telnet',
        'wget',
        'curl',
        'bash-completion',
        'ipmitool',
      ]
    }
    default: { fail("osfamily ${::osfamily} is not supported.") }
  }

  package { $packages:
    ensure => installed,
  }

  anchor { 'profiles::mandatory_packages::end': }

}
