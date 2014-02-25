Analytics = AnalyticsRuby

Analytics.init({
    secret: ENV['SEGMENTIO_KEY'],
    on_error: Proc.new { |status, msg| print msg } 
})
