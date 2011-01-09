# encoding: utf-8

base = __FILE__
$:.unshift(File.join(File.dirname(base), 'lib'))

require 'projmgr'

Gem::Specification.new do |s|
	s.name 									= ProjMgr::APP_NAME
	s.version 							= ProjMgr::VERSION
	s.homepage 							= "http://github.com/hammackj/projmgr/"
	s.summary 							= ProjMgr::APP_NAME
	s.description 					= "#{ProjMgr::APP_NAME} is a source code managment tool for automating project managment"
	s.license								= "BSD"
	
	s.author 								= "Jacob Hammack"
	s.email 								= "jacob.hammack@hammackj.com"
	
	s.files 								= Dir['[A-Z]*'] + Dir['lib/**/*'] + ['projmgr.gemspec']
	s.default_executable 		= ProjMgr::APP_NAME
	s.executables 					= [ProjMgr::APP_NAME]
	s.require_paths 				= ["lib"]
	
	s.required_rubygems_version = ">= 1.3.6"
	s.rubyforge_project         = ProjMgr::APP_NAME
	
	s.add_development_dependency "rspec"
	s.add_development_dependency "rcov"
	
	s.has_rdoc 							= 'yard'
	s.extra_rdoc_files 			= ["README.md", "LICENSE", "NEWS.md", "TODO.md"]
	
	s.add_dependency('choice', '>= 0.1.4')
	
end
