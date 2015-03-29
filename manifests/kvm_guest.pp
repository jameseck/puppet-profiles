class profiles::kvm_guest (
) {

    package { 'qemu-guest-agent':
      ensure => installed,
    }

}
