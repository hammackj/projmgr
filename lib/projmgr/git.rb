# encoding: utf-8

require 'projmgr/scm'

module ProjMgr

	# A wrapper class for interacting with a git repository
	#
	# @author Jacob Hammack <jacob.hammack@hammackj.com>
	class Git < Scm
		alias :checkout :clone

		# Checks out a git repo and places it, in the path specified by the @path variable
		#
		# @return [String] The results from the 'git clone' command
		def checkout
			if path_exists? == true
				return "path exists, cannot checkout onto an existing repo"
			else
				parent = project_parent_directory

				cmd = IO.popen "cd #{parent} && git clone #{@url} &> /dev/null && cd #{@root}"
				results = cmd.readlines
				cmd.close

				return "project checked out to #{parent}/#{@project}"
			end
		end

		# Checks for updates in the target repository
		#
		# @return [String] the results of 'git pull' on the target repository
		def update
			if path_exists? == false
				return "path does not exists, cannot update repository"
			else
				results = `cd #{@path} && git pull && cd #{@root}`

				if results =~ /Already up-to-date./
					return "Already up-to-date!\n"
				else
					return results
				end
			end
		end

		# Checks for local changes in the target repository
		#
		# @return [Boolean] if there is local changes or not
		def has_local_changes?
			if path_exists? == false
				return false, "path does not exists, please check the path or check it out"
			else
				results = `cd #{@path} && git status && cd #{@root}`

				if results !~ /nothing to commit/
					return true, "has local changes"
				elsif results =~ /Your branch is ahead of/
					return true, "has local changes"
				elsif results =~ /Untracked files/
					return true, "has local changes"
				else
					return false, "has no local changes"
				end
			end
		end
	end
end
