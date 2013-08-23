# staging.rb
# server 'staging.server.com', :app, :web, :primary => true
server 'varkek.com', :app, :web, primary: true

set(:rails_env) {'staging'}
set(:deploy_to) {"/home/deploy/sites/varkek/#{rails_env}"}
