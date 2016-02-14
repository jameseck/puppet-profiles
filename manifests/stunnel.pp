class profiles::stunnel (
) {

  file { '/etc/systemd/system/stunnel@.service':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/profiles/stunnel/stunnel@.service'
  }

}
