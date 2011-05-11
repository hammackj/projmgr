# encoding: utf-8

require 'projmgr/scm'

module ProjMgr

	# A parent class for interacting with a source code repository
	#
	# @author Jacob Hammack <jacob.hammack@hammackj.com>
	class Svn < Scm

		# Checks out a svn repo and places it, in the path specified by the @path variable
		#
		# @return [String] The results from the 'svn checkout' command
		def checkout
			if path_exists? == true
				return "path exists, cannot checkout onto an existing repo"
			else
				parent = project_parent_directory

				results = `cd #{parent} && svn checkout #{@url} #{@project} && cd #{@root}`

				if results =~ /Could not resolve hostname/
					return "unable to resolve hostname"
				else
					return "project checked out to #{parent}/#{@project}"
				end
			end
		end

		# Checks for updates in the target repo
		#
		# @return [String] the results of 'git pull' on the target repository
		def update
			if path_exists? == true
				results = `cd #{@path} && svn stat && svn update && cd #{@root}`
			else
				return "path does not exists, cannot update repository"
			end
			
			if results.split("\n").size == 1
				return results.chomp
			else
				return "\n" + results
			end
		end

		# Checks for local changes in the target repository
		#
		# @return [Boolean] if there is local changes or not
		def has_local_changes?
			if path_exists? == false
				return false, "Path does not exists, please check the path or check it out"
			else
				results = `cd #{@path} && svn stat && cd #{@root}`

				if results.length > 0
					return true, "has local changes"
				else
					return false, "has no local changes"
				end
			end
		end
	end
end
