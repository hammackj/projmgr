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

base = __FILE__
$:.unshift(File.join(File.dirname(base), '../lib'))

require 'projmgr'

module ProjMgr
	describe Scm do
		before(:each) do
			@scm = Scm.new
		end

	  describe Scm, ".new" do
	    it "returns Scm Object Scm.new" do
				@scm.class.should == ProjMgr::Scm
	    end
	  end

		describe Scm, ".path_exists?" do
			it "returns false for /tmp/projmgr/doesntexist" do
				@scm.path = '/tmp/projmgr/doesntexist'
				@scm.path_exists?.should == false
			end
		end

		describe Scm, ".project_parent_directory" do
			it "returns /tmp for /tmp/projmgr_test" do
				@scm.path = '/tmp/projmgr_test'
				@scm.project_parent_directory.should == '/tmp'
			end
		end

		describe Scm, ".inspect" do
			it "returns Project/Path/Root/Url for inspect " do
				@scm.project = "/tmp/projmgr"
				@scm.path = "/tmp"
				@scm.root = "/"
				@scm.url = "http://projmgr.hammackj.com/"

				@scm.inspect.should == "Project: /tmp/projmgr\nPath: /tmp\nRoot: /\nUrl: http://projmgr.hammackj.com/\n"
			end
		end
	end
end
