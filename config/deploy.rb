load 'deploy/assets'

set :stages, %w(production staging)
set :default_stage, 'production'

require 'puma/capistrano'
require 'capistrano/ext/multistage'
require 'bundler/capistrano'
require 'capistrano-rbenv'

set :rbenv_install_bundler, true       # ma-deploy install rbenv
set :rbenv_ruby_version, '2.0.0-p353'  # matches rbenv in ma-deploy 

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set(:application)   { 'varkek' }
set(:user)          { 'deploy' }
set(:use_sudo)      { false }
set(:scm)           { :git }
set(:repository)    { 'git@github.com:apologetics/ma-web.git' }
set(:deploy_to)     { "/var/www/ma-web/#{rails_env}" }

server '162.243.245.187', :app, :web, :primary => true

task :symlink_database_yml do
  run "ln -sfn #{shared_path}/config/mongoid.yml #{release_path}/config/mongoid.yml"
  run "ln -sfn #{shared_path}/config/application.yml #{release_path}/config/application.yml"
end
after 'bundle:install', 'symlink_database_yml'

namespace :mongoid do
  desc "Create MongoDB indexes"
  task :index do
    # run "cd #{current_path} && #{bundle_cmd} exec rake db:mongoid:create_indexes", once: true
  end
end

after 'deploy:restart', 'deploy:cleanup'
after 'deploy:update' , 'mongoid:index'
