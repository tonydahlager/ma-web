# production.rb
# server 'production.server.com', :app, :web, :primary => true
server 'varkek.com', :app, :web, primary: true

set(:branch)    {'master'}
set(:rails_env) {'production'}
set(:deploy_to) {"/home/deploy/sites/varkek/#{rails_env}"}
