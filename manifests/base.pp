# ==Class: profiles::base
#
#
class profiles::base (
) {

  notify { 'This is the profiles::base class': }

  include '::profiles::jeuser'
  include '::ssh'
  include '::ntp'

}
