class clip_service::redis () {
  service{'redis-server':
    ensure => running,
    enable => true
  } -> 
  file {'/tmp/base-load':
    ensure => file,
    replace => true,
    source => "puppet:///modules/${module_name}/base-load"
  } ->
  file {'/tmp/load-redis':
    ensure => file,
    replace => true,
    source => "puppet:///modules/${module_name}/load-redis",
    mode => 655
  }-> 
  exec {'load-base-data':
    path        => '/bin:/usr/bin:/sbin:/usr/sbin',
    cwd         => '/tmp',
    command     => "/tmp/load-redis",
    unless      => "test -f /tmp/redis-loaded",
    logoutput   => 'on_failure'
  }
}
