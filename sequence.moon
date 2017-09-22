local _PACKAGE
_PACKAGE  = (...)\match("^(.+)[%./][^%./]+")\gsub("[%./]?node_types", "")
BranchNode = require _PACKAGE.."/node_types/branch_node"

class Sequence extends BranchNode
	success: =>
		@success!
		@actualTask += 1
		if @actualTask <= #@nodes
			@_run @object
		else
			@control\success!
	fail: =>
		@fail!
		@control\fail!