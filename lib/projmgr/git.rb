# Copyright (c) 2010-2012 Arxopia LLC.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of the Arxopia LLC nor the names of its contributors
#     	may be used to endorse or promote products derived from this software
#     	without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL ARXOPIA LLC BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
# OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
#OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
#OF THE POSSIBILITY OF SUCH DAMAGE.

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
					return "Already up-to-date!"
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
