# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks
require 'geo_combine'
spec = Gem::Specification.find_by_name 'geo_combine'
load "#{spec.gem_dir}/lib/tasks/geo_combine.rake"

require 'solr_wrapper/rake_task' unless Rails.env.production?

namespace :datagov do
  desc 'Index all of the GeoBlacklight documents'
  task :index do
    ogm_path = ENV['OGM_PATH'] || 'tmp/opengeometadata'
    solr_url = ENV['SOLR_URL'] || 'http://127.0.0.1:8983/solr/blacklight-core'

    solr = RSolr.connect url: solr_url
    Find.find(ogm_path) do |path|
      next unless path =~ /.*geoblacklight.json$/
      doc = JSON.parse(File.read(path))
      begin
        solr.update params: { commitWithin: 10000, overwrite: true },
                    data: [doc].to_json,
                    headers: { 'Content-Type' => 'application/json' }

      rescue RSolr::Error::Http => error
        puts error
      end
    end
  end
end
