base = __FILE__
$:.unshift(File.join(File.dirname(base), '../lib'))

require 'projmgr'

module ProjMgr
  describe "projmgr", " --help" do
    it "returns usage for --help" do
			cmd = IO.popen "./bin/projmgr --help"
			data = cmd.readlines.to_s
			cmd.close
			
			data.length.should == 537
    end
  end

	describe "projmgr", " -v" do
		it "displays version for -v" do
			cmd = IO.popen "./bin/projmgr -v"
			data = cmd.readlines
			cmd.close
			
			data.first.should == "#{APP_NAME} - v#{VERSION}\n"
		end
	end
end
