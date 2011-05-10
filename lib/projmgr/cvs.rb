# encoding: utf-8

require 'projmgr/scm'

module ProjMgr
	
	# A wrapper class for interacting with a cvs repository
	#
	# @author Jacob Hammack <jacob.hammack@hammackj.com>
	class Cvs < Scm
		
		# Checks out a cvs repo and places it, in the path specified by the @path variable
		#
		# @return [String] The results from the 'cvs co' command
		def checkout
			if path_exists? == true
				return "path exists, cannot checkout onto an existing repo"
			else
				parent = project_parent_directory
				
				cmd = IO.popen "cd #{parent} && CVSROOT=#{@url} cvs co #{@project} &> /dev/null && cd #{@root}"
				results = cmd.readlines
				cmd.close

				return "project checked out to #{parent}/#{@project}"
			end
		end

		# Checks for updates in the target repo
		# 
		# @return [String] the results of 'cvs update' on the target repository
		def update
			if path_exists? == false
				return "path does not exists, cannot update repository"
			else
				results = `cd #{@path} && cvs update 2>&1 && cd #{@root}`
				results = results.split("\n")
				
				results.delete_if do |x|
					x =~ /cvs update: /
				end
						
				if results.empty?
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
		  	results = `cd #{@path} && cvs -q status | grep ^[?F] | grep -v \"to-date\" && cd #{@root}`

			  if results =~ /\? (.*)/ 
					return true, "has local changes"
				else
					return false, "has no local changes"
				end
			end
		end
	end	
end
