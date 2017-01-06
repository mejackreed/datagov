# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks
require 'geo_combine'
spec = Gem::Specification.find_by_name 'geo_combine'
load "#{spec.gem_dir}/lib/tasks/geo_combine.rake"

require 'solr_wrapper/rake_task' unless Rails.env.production?
