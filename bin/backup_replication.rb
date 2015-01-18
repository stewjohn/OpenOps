#!/usr/bin/env ruby
ENV['RAILS_ENV'] ||= 'development'
require File.expand_path('../../config/environment', __FILE__)

Environment.run_backups 

Environment.all.each do |env|
	EbsSnapshot.clean_up_snapshots_for_env(env.id)
end