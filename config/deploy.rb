load 'deploy/assets'

set :stages, %w(production staging)
set :default_stage, 'staging'

require 'capistrano/ext/multistage'
require 'bundler/capistrano'
require 'rvm/capistrano'

set :rvm_type, :system

set(:application)   {'varkek'}
set(:user)          {'deploy'}
set(:use_sudo)      {false}
set(:ssh_options)   {{ forward_agent: true }}
set (:scm)          {:git}
set(:repository)    {'git@github.com:westonplatter/varkek-web.git'}
set(:deploy_to)     {"/home/deploy/sites/varkek/#{rails_env}"}

default_run_options[:pty] = true
server 'varkek.com', :app, :web, :primary => true

# think602's notifications room
require 'hipchat/capistrano'
set(:hipchat_token)       {'48043dcd347f6ba6de724cab65b1a0'}
set(:hipchat_room_name)   {'notifications'}
set(:hipchat_announce)    {true} # notify users?
set(:hipchat_env)         {rails_env}

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

namespace :mongoid do
  desc "Create MongoDB indexes"
  task :index do
    # run "cd #{current_path} && #{bundle_cmd} exec rake db:mongoid:create_indexes", once: true
  end
end

after 'deploy:restart', 'deploy:cleanup'
after 'deploy:update' , 'mongoid:index'
