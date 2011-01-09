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
				#@scm = Scm.new nil, '/tmp/projmgr/doesntexist', nil, nil
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
