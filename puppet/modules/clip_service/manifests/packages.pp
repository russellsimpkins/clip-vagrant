clip_service::packages () {
      
  package{['golang',
           'golang.tools',
           'redis-server',
           'git',
           'emacs']:
             ensure => present
  }

}
