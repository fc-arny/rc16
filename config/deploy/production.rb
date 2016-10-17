set :stage, :production
set :keep_releases, 5
set :branch, 'master'

server '192.168.157.12', user: 'deploy', roles: %w[app db]
