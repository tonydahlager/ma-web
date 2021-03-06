# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :rspec do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }

  # Rails example
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.*)(\.erb|\.haml)$})                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
  watch('app/controllers/application_controller.rb')  { "spec/controllers" }
  
  # -- none
  # watch('config/routes.rb')                           { "spec/routing" }

  # -- none
  # Capybara features specs
  # watch(%r{^app/views/(.+)/.*\.(erb|haml)$})          { |m| "spec/features/#{m[1]}_spec.rb" }
  
  # -- none
  # Turnip features and steps
  #watch(%r{^spec/acceptance/(.+)\.feature$})
  #watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$})   { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'spec/acceptance' }
end

### all specs
#
group 'a' do 
  guard 'rspec', :spec_paths => ['spec/models', 'spec/controllers', 'spec/views'], :cli => "--color"
end


### Models
#
group 'm' do
  guard 'rspec', :spec_paths => ['spec/models'], :cli => "--color --format progress"
end

### Controllers
#
group 'c' do 
  guard 'rspec', spec_paths: ['spec/controllers'], :cli => "--color --format progress"
end

### Views
#
group 'v' do 
  guard 'rspec', spec_paths: ['spec/views'], :cli => "--color --format progress"
end

### Lib
# 
group 'l' do 
  guard 'rspec', spec_paths: ['spec/lib'], :cli => "--color --format progress"
end

group 'f' do 
  guard 'rspec', spec_paths: ['spec/features'], :cli => '--color --format progress'
end
