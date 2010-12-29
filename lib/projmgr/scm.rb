module ProjMgr
	
	# A parent class for interacting with a source code repository
	#
	# @author Jacob Hammack <jacob.hammack@hammackj.com>
	class Scm
		
		# Creates a instance of a SCM repository
		#
		# @param project name of the project
		# @param path path to the project
		# @param root path back to the root
		#
		def initialize project, path, root
			@project = project
			@path = path
			@root = root
		end	
	end
end
