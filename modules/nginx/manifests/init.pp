class nginx {
  package { ‘nginx’:
    ensure => installed,
  }
  package { 'curl':
    ensure => installed,
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
