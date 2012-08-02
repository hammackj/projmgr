$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require 'rake'
#require 'spec/rake/spectask'

require "projmgr"

task :build do
  system "gem build projmgr.gemspec"
end

task :release => :build do
  system "gem push projmgr-#{ProjMgr::VERSION}.gem"
	puts "Just released Projmgr v#{ProjMgr::VERSION}. Projmgr is always available in RubyGems!"
end

task :clean do
	system "rm *.gem"
	system "rm -rf coverage"
end
