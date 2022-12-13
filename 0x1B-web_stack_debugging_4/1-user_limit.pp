# login as holberton and open any number of files without any error message.
exec {'open any files without limits':
  command => 'sed -rie \'s/(holberton (hard|soft) nofile).*/\1 1000/gi\' /etc/security/limits.conf',
  path    => 'usr/bin/:/bin/'
}
