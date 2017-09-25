BranchNode = require "node_types/branch_node"

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
	__tostring: =>
		return "instance of class Sequence"

return Sequence