class clip_service::gocode() {
  exec {"update_clip":
    path        => '/bin:/usr/bin:/sbin:/usr/sbin',
    cwd         => '/gopath',
    environment => 'GOPATH=/gopath',
    command     => "go get -u github.com/russellsimpkins/clip-service",
    logoutput   => 'on_failure'
  } ->
  exec {"update_ensemble":
    path        => '/bin:/usr/bin:/sbin:/usr/sbin',
    cwd         => '/gopath',
    environment => 'GOPATH=/gopath',
    command     => "go get -u github.com/russellsimpkins/ensemble-service",
    logoutput   => 'on_failure'
  } ->
  exec {"build_clip_service":
    path        => '/bin:/usr/bin:/sbin:/usr/sbin',
    cwd         => '/gopath',
    environment => 'GOPATH=/gopath',
    command     => "go build -o /usr/bin/clip-service /gopath/clip-service/service.go ",
    unless      => "test -f /usr/bin/clip-service",
    logoutput   => 'on_failure'
  } ->
  exec {"build_magic_service":
    path        => '/bin:/usr/bin:/sbin:/usr/sbin',
    cwd         => '/gopath',
    environment => 'GOPATH=/gopath',
    command     => "go build -o /usr/bin/magic /gopath/ensemble-service/magic.go ",
    unless      => "test -f /usr/bin/magic",
    logoutput   => 'on_failure'
  } ->
  file{'/etc/init.d/magic':
    ensure => file,
    replace => true,
    source => "puppet:///modules/${module_name}/magic",
    mode => 655
    
  } ->
  file{'/etc/init.d/clip-service':
    ensure => file,
    replace => true,
    source => "puppet:///modules/${module_name}/clip_service",
    mode => 655
  }
  ->
  service{'clip-service':
    ensure => running,
    enable => true
  } ->
  service{'magic':
    ensure => running,
    enable => true
  }  
}
