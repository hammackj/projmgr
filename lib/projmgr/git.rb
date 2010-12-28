#
#
module ProjMgr
	
	#
	#
	class Git < Scm

		#
		#
		def update
	  	results = system('cd #{@prefix}/#{@project} && git pull && cd #{@root}')

	  	if results =~ /Already up-to-date./
	  	  print "Already up-to-date!\n"
	  	else
	  	  puts results  	  
		  end
		end
		
		#
		#
		def has_local_changes?
		  results = system('cd #{@prefix}/#{@project} && git status && cd #{@root}')

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
