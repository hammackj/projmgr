# encoding: utf-8

base = __FILE__
$:.unshift(File.join(File.dirname(base), 'lib'))

require 'projmgr'

Gem::Specification.new do |s|
	s.name 									= 'projmgr'
	s.version 							= ProjMgr::VERSION
	s.homepage 							= "http://www.hammackj.com/"
	s.summary 							= "ProjMgr"
	s.description 					= "ProjMgr is a source code managment tool for automating project managment"
	
	s.author 								= "Jacob Hammack"
	s.email 								= "jacob.hammack@hammackj.com"
	
	s.files 								= Dir['[A-Z]*'] + Dir['lib/**/*'] + ['projmgr.gemspec']
	s.default_executable 		= 'projmgr'
	s.executables 					= ['projmgr']
	s.require_paths 				= ["lib"]
	
	s.has_rdoc 							= 'yard'
	s.extra_rdoc_files 			= ["README.md", "LICENSE", "NEWS.md", "TODO.md"]
	
	s.add_dependency('choice', '>= 0.1.4')
	
end
