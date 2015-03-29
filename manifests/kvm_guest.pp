class profiles::kvm_guest (
  $package_ensure = 'absent',
  $service_ensure = 'stopped',
  $service_enable = 'false',
) {

    package { 'qemu-guest-agent':
      ensure => $package_ensure,
    }

    service { 'qemu-guest-agent':
      ensure => $service_ensure,
      enable => $service_enable,
    }

}
