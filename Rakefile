$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "projmgr"
 
task :build do
  system "gem build projmgr.gemspec"
end
 
task :release => :build do
  system "gem push projmgr-#{ProjMgr::VERSION}.gem"
end

task :clean do
	system "rm *.gem"
end
