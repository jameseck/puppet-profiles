class profiles::keepalived_dns (
  $state    = 'MASTER',
  $priority = '101',
  $ipcheck  = $::ipaddress,
) {

  include '::keepalived'
  file { '/etc/keepalived/notify-keepalived.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('profiles/keepalived_dns/notify-keepalived.sh.erb'),
  } ->
  file { '/etc/keepalived/check-keepalived.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('profiles/keepalived_dns/check-keepalived.sh.erb'),
  } ->
  keepalived::vrrp::instance { 'VI_DNS':
    interface         => 'eth0',
    state             => $state,
    virtual_router_id => '50',
    priority          => $priority,
    auth_type         => 'PASS',
    auth_pass         => 'secret',
    virtual_ipaddress => [ '192.168.1.2/24' ],
    notify_script     => '/etc/keepalived/notify-keepalived.sh',
    track_script      => 'checkscript',
  } ->
  keepalived::vrrp::script { 'checkscript':
    script   => '/etc/keepalived/check-keepalived.sh',
    interval => 2,
    rise     => 2,
    fall     => 2,
    weight   => 2,
  }


}
