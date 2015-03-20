# ==Class: profiles::base
#
#
class profiles::base (
) {

  include '::profiles::jeuser'
  include '::profiles::mandatory_packages'
  include '::ssh'
  include '::ntp'
  include '::sudo'

}
