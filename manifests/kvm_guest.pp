class profiles::kvm_guest (
  $package_ensure = 'absent',
  $service_ensure = 'stopped',
  $service_enable = 'false',
) {

    package { 'qemu-guest-agent':
      ensure => installed,
    }

    service { 'qemu-guest-agent':
      ensure => running,
      enable => true,
    }

}
