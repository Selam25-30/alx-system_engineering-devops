# configures the ssh/ssh_config file to use the identity file 'etc/ssh/ssh_config'
# and not to use password authentication

include stdlib

file_line { 'change identity file location':
  path    => '/etc/ssh/ssh_config',
  line    => '    IdentityFile ~/.ssh/school',
  replace => true,
}

file_line { 'disable pwd authentication':
  path    => '/etc/ssh/ssh_config',
  line    => '    PasswordAuthentication no',
  replace => true,
}
