# staging.rb
# server 'staging.server.com', :app, :web, :primary => true

set(:rails_env) {'staging'}
set(:branch)    { `git branch`.match(/\* (\S+)\s/m)[1] }
