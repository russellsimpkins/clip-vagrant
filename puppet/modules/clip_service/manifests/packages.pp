class clip_service::packages () {
  exec {"update_apt_get":
    path        => '/bin:/usr/bin:/sbin:/usr/sbin',
    command     => "apt-get update --fix-missing",
    logoutput   => 'on_failure'
  } ->
  package{['golang',
           'golang.tools',
           'redis-server',
           'git',
           'emacs']:
             ensure => present
  }

}
