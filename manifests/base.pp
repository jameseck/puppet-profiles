class profiles::base (
) {

  notify { 'This is the profiles::base class': }

  include '::profiles::jeuser'

}
