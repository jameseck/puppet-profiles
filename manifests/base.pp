# ==Class: profiles::base
#
#
class profiles::base (
) {

  include '::profiles::jeuser'
  include '::profiles::mandatory_packages'
  include '::profiles::puppet'
  include '::ntp'
  include '::sudo'
  include '::timezone'
  include '::ssh'

  if ( $::osfamily == 'RedHat' ) {
    include '::profiles::redhat_base'
  }

#  ::ssh::client::config::user { 'root':
#    ensure              => present,
#    user_home_dir       => '/root',
#    manage_user_ssh_dir => false,
#    options             => {
#      'ForwardAgent' => 'yes'
#    }
#  }

#  if ( $::virtual == 'kvm' ) {
#    include '::profiles::kvm_guest'
#  }

}
