
module ProjMgr
	
	class Svn < Scm
		
		def update
		  results = system('cd #{prefix}/#{project}  && svn stat && svn update && cd #{@root}')
		  puts results
		end
	
		def has_local_changes?
			results = system('cd #{@prefix}/#{@project} && svn stat && cd #{@root}')
			
			if results.lenght > 0
				return true
			else
				return false
			end
		end
	
	end

end
