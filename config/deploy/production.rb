server '13.115.41.130', user: 'vagrant', roles: %w{app db web}
set :ssh_options, keys: '/home/vagrant/.ssh/id_rsa'
