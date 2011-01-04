
module ProjMgr
	APP_NAME = "projmgr"
	VERSION = "0.0.2"
	CONFIG_FILE = "~/.projmgr"
end

require 'choice'
require 'yaml'

require 'projmgr/git'
require 'projmgr/svn'
require 'projmgr/scm'
