# Copy and pasted from,
# https://github.com/mauriciozaffari/mongoid_search/blob/master/tasks/mongoid_search.rake
# since `rake mongoid_search` was not being loaded.
# 
namespace :mongoid_search do
  desc 'Goes through all documents with search enabled and indexes the keywords.'
  task :index => :environment do
    ::Rails.application.eager_load!
    if Mongoid::Search.classes.blank?
      Mongoid::Search::Log.log "No model to index keywords.\n"
    else
      Mongoid::Search.classes.each do |klass|
        Mongoid::Search::Log.silent = ENV['SILENT']
        Mongoid::Search::Log.log "\nIndexing documents for #{klass.name}:\n"
        klass.index_keywords!
      end
      Mongoid::Search::Log.log "\n\nDone.\n"
    end
  end
end
