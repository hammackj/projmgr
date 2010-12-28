require 'projmgr/scm'

module ProjMgr
	
	class Svn < Scm
		
		def update
		  results = `cd #{@path}  && svn stat && svn update && cd #{@root}`
		  puts results
		end
	
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
