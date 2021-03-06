class clip_service::nginx {
  package{'nginx':
    ensure => present
    } ->
    file{'/etc/nginx/sites-enabled/default':
      ensure   => file,
      replace  => true,
      source   => "puppet:///modules/${module_name}/default_site_config",
      notify   => Service['nginx']
    } ->
    service{'nginx':
      ensure => running,
      enable => true
    }
}
