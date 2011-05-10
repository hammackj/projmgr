# encoding: utf-8

module ProjMgr
	APP_NAME = "projmgr"
	VERSION = "0.0.8"
	CONFIG_FILE = "~/.projmgr"
end

require 'projmgr/scm'
require 'projmgr/git'
require 'projmgr/svn'
require 'projmgr/cvs'
