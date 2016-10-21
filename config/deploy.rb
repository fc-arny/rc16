# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'rc16'
set :rails_env, 'production'
set :repo_url, 'git@gitlab.at-consulting.ru:dfp/rc16.git'

set :user, 'deploy'

append :linked_files,
       'config/database.yml',
       'config/secrets.yml',
       'config/settings.yml',
       'config/sidekiq.yml'

append :linked_dirs,
       'log',
       'tmp/cache',
       'tmp/pids',
       'tmp/sockets',
       'public/system',
       'public/ckeditor_assets',
       'node_modules'

set :scm, :git
set :ssh_options, forward_agent: true # # Используем локальные ключи, а не ключи сервера
set :deploy_to, "/home/#{fetch(:user)}/railsclub"

# RAILS SETTINGS (BUNDLER, ASSETS, MIGRATIONS)
set :bundle_roles, [:app, :db]
set :assets_roles, [:app]
set :migration_role, :app # Recommendation in https://github.com/capistrano/rails

# RVM SETTINGS
set :rvm_type, :user                # Defaults to: :auto
set :rvm_ruby_version, '2.3.1'      # Defaults to: 'default'
# set :rvm_custom_path, '~/.myveryownrvm'  # only needed if not detected
set :rvm_roles, [:app]

# PUMA SETTINGS
# Внимание!
# Настройки ниже нужны чтобы сформировать конфиг пумы и отправить на сервер
# Команда `cap staging puma:config`
set :puma_user, fetch(:user)
set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock" # accept array for multi-bind
set :puma_default_control_app, "unix://#{shared_path}/tmp/sockets/pumactl.sock"
set :puma_conf, "#{shared_path}/config/puma.rb"
set :puma_access_log, "#{shared_path}/log/puma_access.log"
set :puma_error_log, "#{shared_path}/log/puma_error.log"
set :puma_role, :app
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
set :puma_threads, [0, 16]
set :puma_workers, 0
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :puma_preload_app, false
set :puma_bind, %w[tcp://0.0.0.0:3000]

# OTHER DEFAULT SETTINGS
# set :format, :airbrussh # Default value for :format is :airbrussh.
# You can configure the Airbrussh format using :format_options. These are the defaults.
# set :format_options, command_output: true,
#                      log_file: 'log/capistrano.log',
#                      color: :auto,
#                      truncate: :auto
# append :linked_files, 'config/database.yml', 'config/secrets.yml' # Default value for :linked_files is []
# append :linked_dirs,
#        'log',
#        'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system' # Default value for linked_dirs is []
# set :default_env, { path: "/opt/ruby/bin:$PATH" } # Default value for default_env is {}
# set :keep_releases, 5 # Default value for keep_releases is 5

before 'deploy:compile_assets', 'deploy:build_js'
namespace :deploy do
  task :build_js do
    on roles(:app) do
      within release_path do
        execute :npm, 'install', '--silent'
        execute :npm, 'run', 'build'
      end
    end
  end
end
