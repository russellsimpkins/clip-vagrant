class clip_service::redis () {
  service{'redis-server':
    ensure => running
  } -> 
  file {'/tmp/base-load':
    ensure => file,
    replace => true,
    source => "puppet:///modules/${module_name}/base-load"
  } -> 
  exec {'load-base-data':
    path        => '/bin:/usr/bin:/sbin:/usr/sbin',
    cwd         => '/tmp',
    command     => "cat /tmp/base-load; sleep 10; |nc localhost 6379 > /tmp/redis-loaded ",
    unless      => "test -f /tmp/redis-loaded",
    logoutput   => 'on_failure'
  }
}
