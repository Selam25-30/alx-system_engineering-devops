# A puppet manifest that installs nginx and custom HTTP header response

exec { 'apt-update':
  command  => '/usr/bin/apt-get update',
  provider => shell,
}

package { 'nginx':
  ensure   => installed,
  require  => Exec['apt-update'],
}

file_line { 'for redirection directive':
  ensure   => 'present',
  path     => '/etc/nginx/sites-available/default',
  after    => 'listen on 80 default_server;',
  line     => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
  require  => Package['nginx'],
}

file_line { 'custom header line to add into the config file':
  ensure   => 'present',
  path     => '/etc/nginx/sites-available/default',
  after    => 'listen on 80 default_server;',
  line     => 'add_header X-served-By $hostname;',
  require  => Package['nginx'],
}

file { '/var/www/html/index.nginx-debian.html':
  ensure   => 'present',
  content  => 'Hello World!',
  require  => Package['nginx'],
}

exec { 'start nginx':
  command  => '/usr/bin/sudo service nginx start',
  provider => shell,
}
