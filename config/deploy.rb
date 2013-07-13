load 'deploy/assets'

set :stages, %w(production staging)
set :default_stage, 'staging'

require 'capistrano/ext/multistage'
require 'bundler/capistrano'
require 'rvm/capistrano'

set :rvm_type, :system

set :application, 'varkek'
set :user, 'deploy'
set :use_sudo, false
set :ssh_options, { forward_agent: true }
default_run_options[:pty] = true

set :scm,         :git
set :repository,  'git@github.com:westonplatter/varkek-web.git'
# set :deploy_to,   '/home/deploy/sites/varkek'
# set :deploy_via,  :remote_cache

# if you want to clean up old releases on each deploy uncomment this:
# after 'deploy:restart', 'deploy:cleanup'

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, roles: :app, except: { no_release: true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

task :symlink_database_yml do
  run "ln -sfn #{shared_path}/config/mongoid.yml #{release_path}/config/mongoid.yml"
  run "ln -sfn #{shared_path}/config/application.yml #{release_path}/config/application.yml"
end
after 'bundle:install', 'symlink_database_yml'
