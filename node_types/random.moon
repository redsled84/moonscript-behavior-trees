BranchNode = require "node_types/branch_node"

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

return Random