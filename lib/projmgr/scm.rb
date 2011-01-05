# encoding: utf-8

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
		# @param url url of the repo for checkout/etc
		#
		def initialize project=nil, path=nil, root=nil, url=nil
			@project = project
			@path = path
			@root = root
			@url = url
		end
		
		# Checks to see if a path exists 
		#
		# @return [Boolean] True or False based on if the @path exists
		def path_exists?
			return File.exists?(File.expand_path(@path))
		end
		
		# Retrieves the parent directory of a path
		#
		# @return [String] parent directory of the @path variable
		def project_parent_directory
			pn = Pathname.new @path	
			return pn.parent.to_s
		end
	end
end
