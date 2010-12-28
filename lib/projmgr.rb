
module ProjMgr
	VERSION = "0.0.1"
	CONFIG_FILE = "~/.projmgr"
end

require 'rubygems'
require 'choice'
require 'yaml'

require 'projmgr/git'
require 'projmgr/svn'
require 'projmgr/scm'
