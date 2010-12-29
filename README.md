ProjMgr
===

ProjMgr is a simple source code project manager for updating and checking local changes on multiple projects at once.

Requirements
---

* ruby 
* rubygems
* choice
* yaml 


Installation
---
Installation is really easy just gem install!

	% sudo gem install projmgr
	
Usage
---
Using ProjMgr is fairly simple. Once installation is complete type to create a skeleton config file:

	% projmgr --create-file
	[*] An empty ~/.projmgr has been created. Please edit and fill in the correct values.

This will create a empty skeleton config file, ~/.projmgr, edit this file. The file is a simple yaml configuration file structured like this

	rubyvirustotal: 
	  name: ruby-virustotal
	  path: ~/Projects/public/ruby-virustotal
	  type: git

	nessusdb:
	  name: nessusdb
	  path: ~/Projects/public/nessusdb
	  type: git

	projectname: 
		name: 
		path: 
		type: 

To configure ProjMgr just change projectname/name/path/type to fit your projects. Once the config file is edited you are ready to go. 

Simple usage is as follows:

Checking for local changes
----

	% projmgr -c
	[!] ProjMgr has local changes
	[!] nessusdb has local changes
	

Updating each project
----

	% projmgr -u
	[*] Updating ProjMgr ...
	Already up-to-date!
	[*] Updating nessusdb ...
	Already up-to-date!

That covers all of the basic usage of ProjMgr.
	
Contact
---
You can reach me at jacob[dot]hammack[at]hammackj[dot]com.
