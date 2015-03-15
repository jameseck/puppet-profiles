class profiles::jeuser (
) {

  $passwd = hiera('je_user_passwd')
  $ssh_key = hiera('je_ssh_key')

  user { 'james':
    ensure => present,
    uid    => 1000,
    gid    => 1000,
    passwd => 
  }

  group { 'james':
    ensure => present,
    gid    => 1000,
  }

  ssh_authorized_key { 'james_key':
    ensure => present,
    name   => 'James Eckersall 2008',
    user   => 'james',
    type   => 'ssh-rsa',
    key    => $ssh_key,
  }
  ssh_authorized_key { 'root_je_key':
    ensure => present,
    name   => 'James Eckersall 2008',
    user   => 'root',
    type   => 'ssh-rsa',
    key    => $ssh_key,
  }

}
