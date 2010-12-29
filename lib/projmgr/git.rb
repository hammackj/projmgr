require 'projmgr/scm'

module ProjMgr
	
	# A wrapper class for interacting with a git repository
	#
	# @author Jacob Hammack <jacob.hammack@hammackj.com>
	class Git < Scm

		# Checks for updates in the target repo
		# 
		# @return [String] the results of 'git pull' on the target repository
		def update
	  	results = `cd #{@path} && git pull && cd #{@root}`

	  	if results =~ /Already up-to-date./
	  	  return "Already up-to-date!\n"
	  	else
	  	  return results  	  
		  end
		end
		
		# Checks for local changes in the target repository
		#
		# @return [Boolean] if there is local changes or not
		def has_local_changes?
		  results = `cd #{@path} && git status && cd #{@root}`

		  if results !~ /nothing to commit/ 
				return true
			elsif results =~ /Your branch is ahead of/
				return true
			elsif results =~ /Untracked files/
				return true
		  else
				return false
			end
		end
	end	
end
