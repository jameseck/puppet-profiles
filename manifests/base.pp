# ==Class: profiles::base
#
#
class profiles::base (
) {

  notify { 'This is the profiles::base class': }

  include '::profiles::jeuser'
  include '::profiles::mandatory_packages'
  include '::ssh'
  include '::ntp'
  include '::sudo'

}
