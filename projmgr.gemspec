# encoding: utf-8

base = __FILE__
$:.unshift(File.join(File.dirname(base), 'lib'))

require 'projmgr'

Gem::Specification.new do |s|
	s.name 									= 'projmgr'
	s.version 							= ProjMgr::VERSION
	s.homepage 							= "http://github.com/hammackj/projmgr/"
	s.summary 							= "ProjMgr"
	s.description 					= "ProjMgr is a source code managment tool for automating project managment"
	s.license								= "BSD"
	
	s.author 								= "Jacob Hammack"
	s.email 								= "jacob.hammack@hammackj.com"
	
	s.files 								= Dir['[A-Z]*'] + Dir['lib/**/*'] + ['projmgr.gemspec']
	s.default_executable 		= 'projmgr'
	s.executables 					= ['projmgr']
	s.require_paths 				= ["lib"]
	
	s.required_rubygems_version = ">= 1.3.6"
	s.rubyforge_project         = "projmgr"
	
	s.add_development_dependency "rspec"
	
	s.has_rdoc 							= 'yard'
	s.extra_rdoc_files 			= ["README.md", "LICENSE", "NEWS.md", "TODO.md"]
	
	s.add_dependency('choice', '>= 0.1.4')
	
end
