require 'projmgr/scm'

module ProjMgr
	
	# A parent class for interacting with a source code repository
	#
	# @author Jacob Hammack <jacob.hammack@hammackj.com>
	class Svn < Scm
		
		# Checks for updates in the target repo
		# 
		# @return [String] the results of 'git pull' on the target repository
		def update
		  results = `cd #{@path}  && svn stat && svn update && cd #{@root}`
		  return results
		end

		# Checks for local changes in the target repository
		#
		# @return [Boolean] if there is local changes or not
		def has_local_changes?
			results = `cd #{@path} && svn stat && cd #{@root}`
			
			if results.length > 0
				return true
			else
				return false
			end
		end
	end
end
