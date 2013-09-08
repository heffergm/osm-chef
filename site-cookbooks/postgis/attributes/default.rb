# abacus
default[:abacus][:install_method]   = 'py'
default[:abacus][:filehandle_limit] = 10240
default[:abacus][:install_path]     = '/opt/abacus'
default[:abacus][:build_path]       = '/var/lib/abacus'
default[:abacus][:repository]       = 'git://github.rackspace.com/common/abacus.git'
default[:abacus][:user]             = 'abacus'
default[:abacus][:group]            = 'abacus'
default[:abacus][:user_shell]       = '/bin/false'
default[:abacus][:user_keygen]      = false
default[:abacus][:apache_proxy]     = false

# version per env
case chef_environment
when 'production'
  default[:abacus][:revision] = 'master'
when 'staging'
  default[:abacus][:revision] = 'master'
else # assume head
  default[:abacus][:revision] = 'master'
end

# python
default[:python][:install_method] = 'package'
