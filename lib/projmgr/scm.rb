# encoding: utf-8

require 'pathname'

module ProjMgr
	
	# A parent class for interacting with a source code repository
	#
	# @author Jacob Hammack <jacob.hammack@hammackj.com>
	class Scm
		attr_accessor :project, :path, :root, :url
		
		# Creates a instance of a SCM repository
		#
		# @param project name of the project
		# @param path path to the project
		# @param root path back to the root
		# @param url url of the repo for checkout/etc
		#
		# @return [Scm] returns a new instance of the Scm class
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
		
		# Overloaded inspect
		#
		# @return [String] A representation of the class as a string
		def inspect
			return "Project: #{@project}\n" + "Path: #{@path}\n" + "Root: #{@root}\n" + "Url: #{@url}\n"
		end
	end
end
