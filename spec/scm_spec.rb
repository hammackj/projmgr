base = __FILE__
$:.unshift(File.join(File.dirname(base), '../lib'))

require 'projmgr'

module ProjMgr
  describe "Scm", ".new" do
    it "returns Scm Object Scm.new" do
			scm = Scm.new
      scm.class.should == ProjMgr::Scm
    end
  end

	describe "Scm", ".path_exists?" do
		it "returns false for /tmp/projmgr/doesntexist" do
			scm = Scm.new nil, '/tmp/projmgr/doesntexist', nil, nil
			scm.path_exists?.should == false
		end
	end
	
	describe "Scm", ".project_parent_directory" do
		it "returns /tmp for /tmp/projmgr_test" do
			`mkdir -p /tmp/projmgr_test`
			
			scm = Scm.new nil, '/tmp/projmgr_test', nil, nil
			scm.project_parent_directory.should == '/tmp'
		end
	end
end
