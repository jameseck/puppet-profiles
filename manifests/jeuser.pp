# ==Class: profiles::jeuser
#
#
class profiles::jeuser (
) {

  $passwd = hiera('je_user_passwd')
  $ssh_key = hiera('je_ssh_key')

  user { 'james':
    ensure => present,
    uid    => 1000,
    gid    => 1000,
    passwd =>  $passwd,
  }

  group { 'james':
    ensure => present,
    gid    => 1000,
  }

  ssh_authorized_key { 'james_key':
    ensure => present,
    name   => 'James Eckersall 2008_james',
    user   => 'james',
    type   => 'ssh-rsa',
    key    => $ssh_key,
  }
  ssh_authorized_key { 'root_je_key':
    ensure => present,
    name   => 'James Eckersall 2008_root',
    user   => 'root',
    type   => 'ssh-rsa',
    key    => $ssh_key,
  }

}
