local _PACKAGE
_PACKAGE  = (...)\match("^(.+)[%./][^%./]+")\gsub("[%./]?node_types", "")
BranchNode = require _PACKAGE.."/node_types/branch_node"

class Random extends BranchNode
	start: (object) =>
		super self, object
		@actualTask = math.floor math.random * #@nodes+1
	success: =>
		super!
		@control\success!
	fail: =>
		super!
		@control\fail!
