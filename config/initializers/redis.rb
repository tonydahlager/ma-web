# gem 'redis'

if Rails.env.test?
  $redis = Redis.new db: 1
else
  $redis = Redis.connect url: 'redis://127.0.0.1:6379'
end
