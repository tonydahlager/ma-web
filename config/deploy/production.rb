# production.rb
# server 'production.server.com', :app, :web, :primary => true
server 'varkek.com', :app, :web, primary: true
set :rails_env, 'production'
set :deploy_to, "~/sites/varkek/#{rails_env}"