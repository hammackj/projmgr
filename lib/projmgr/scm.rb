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

require 'pathname'

module ProjMgr

	# A parent class for interacting with a source code repository
	#
	# @author Jacob Hammack <jacob.hammack@hammackj.com>
	class Scm
		attr_accessor :project, :path, :root, :url

		# Creates a instance of a SCM repository
		#
		# @param project name of the project
		# @param path path to the project
		# @param root path back to the root
		# @param url url of the repo for checkout/etc
		#
		# @return [Scm] returns a new instance of the Scm class
		def initialize project=nil, path=nil, root=nil, url=nil
			@project = project
			@path = path
			@root = root
			@url = url
		end

		# Checks to see if a path exists
		#
		# @return [Boolean] True or False based on if the @path exists
		def path_exists?
			return File.exists?(File.expand_path(@path))
		end

		# Retrieves the parent directory of a path
		#
		# @return [String] parent directory of the @path variable
		def project_parent_directory
			pn = Pathname.new @path
			return pn.parent.to_s
		end

		# Overloaded inspect
		#
		# @return [String] A representation of the class as a string
		def inspect
			return "Project: #{@project}\n" + "Path: #{@path}\n" + "Root: #{@root}\n" + "Url: #{@url}\n"
		end
	end
end
