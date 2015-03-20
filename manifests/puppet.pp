class profiles::puppet (
) {

  class { '::puppet':
    puppet_master_ip => hiera('puppet_master_ip'),
    puppet_ca_ip     => hiera('puppet_ca_ip')
  }

}
