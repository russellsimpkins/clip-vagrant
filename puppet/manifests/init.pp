Exec {
  path => ['/usr/local/bin','/usr/local/sbin',
           '/usr/bin',
           '/usr/sbin',
           '/bin',
           '/sbin',
           '/var/nyt/bin',
           '/root/bin']
}

Package{
  allow_virtual => false
}

stage { 'prereqs':
  before => Stage['main'],
}

stage { 'final':
  require => Stage['main'],
}

node 'localhost.nyhq.nytint.com' {
    include clip_service
}
