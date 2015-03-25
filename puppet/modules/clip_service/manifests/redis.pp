class clip_service::redis () {
  package{'redis':
    ensure => present
  } ->
  service{'redis-server':
    ensure => running
  }
}
