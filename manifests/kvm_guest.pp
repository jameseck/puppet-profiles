class profiles::kvm_guest (
) {

    package { 'qemu-guest-agent':
      ensure => installed,
    }

    service { 'qemu-guest-agent':
      ensure => running,
      enable => true,
    }

}
