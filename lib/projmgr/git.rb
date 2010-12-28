require 'projmgr/scm'

#
#
module ProjMgr
	
	#
	#
	class Git < Scm

		#
		#
		def update
	  	results = `cd #{@path} && git pull && cd #{@root}`

	  	if results =~ /Already up-to-date./
	  	  print "Already up-to-date!\n"
	  	else
	  	  puts results  	  
		  end
		end
		
		#
		#
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
