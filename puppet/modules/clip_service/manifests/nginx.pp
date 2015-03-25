class clip_service::nginx {
  package{'nginx':
    ensure => present
    } ->
    file{'/etc/nginx/sites-enabled/default':
      ensure   => file,
      replace  => true,
      source   => "puppet://${module_name}/default_site_config"
    } ->
    service{'nginx':
      ensure => running
    }
}
