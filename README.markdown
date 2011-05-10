# ProjMgr


ProjMgr is a simple source code project manager for updating and checking local changes on multiple projects at once.

The current version is v0.0.8

## Requirements

* ruby / rubygems

## Installation
Installation is really easy just gem install!

	% gem install projmgr
	
## Usage
Using ProjMgr is fairly simple. Once installation is complete type to create a skeleton config file:

	% projmgr --create-file
	[*] An empty ~/.projmgr has been created. Please edit and fill in the correct values.

This will create a empty skeleton config file, ~/.projmgr, edit this file. The file is a simple yaml configuration file structured like this:


	rubyvirustotal: 
	  name: ruby-virustotal
	  path: ~/Projects/public/ruby-virustotal
	  type: git
		url: git@github.com:hammackj/ruby-virustotal.git

	nessusdb:
	  name: nessusdb
	  path: ~/Projects/public/nessusdb
	  type: git
		url: git@github.com:hammackj/nessusdb.git

	metasploit:
   name: metasploit
   path: ~/Projects/public/metasploit
   type: svn
   url: https://www.metasploit.com/svn/framework3/trunk/

	cvstest:
	  name: cvstest
	  path: ~/Projects/public/cvstest
	  type: cvs
		url: hammackj@hammackj.com:/usr/local/cvs

	projectname: 
		name: 
		path: 
		type: 
		url:

To configure ProjMgr just change projectname/name/path/type to fit your projects. 

	projectname - can be any string identifier
	name - any string displayed during update/checks
	path - the path to the repo to check/update
	type - type of the repo either 'svn' or 'git'
	url - the original url of the repo

Once the config file is edited everything is ready to go. 

Simple usage is as follows:

### Checking for local changes

	% projmgr -c
	[!] ProjMgr has local changes
	[!] nessusdb has local changes
	

### Updating each project

	% projmgr -u
	[*] Updating ProjMgr...
	Already up-to-date!
	[*] Updating nessusdb...
	Already up-to-date!

That covers all of the basic usage of ProjMgr.
	
## Contact
You can reach me at jacob[dot]hammack[at]hammackj[dot]com.
