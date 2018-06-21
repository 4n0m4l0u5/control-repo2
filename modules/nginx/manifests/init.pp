class nginx {
  package { ‘nginx’:
    ensure => present,
  }
  package { 'curl':
    ensure =. present,
  }
  file { ‘/var/www/index.html’:
    ensure => file,
    require => Package[‘nginx’],
    content => 'Automation for the People',
  }
  service { ‘nginx’:
    ensure => running,
    enable = true,
  }
  exec { 'curl-site':
    command => 'curl localhost'
  }
  
}
