Registry = require "registry"
Node = require "node_types/node"

class BranchNode extends Node
	start: (object) =>
		if not @nodeRunning
			@setObject\object
			@actualTask = 1
	run: (object) =>
		if @actualTask <= #@nodes
			@_run object
	_run: (object) =>
		if not @nodeRunning
			@node = Registry\getNode @nodes[@actualTask]
			@node\start object
			@node\setControl self
		@node\run object
	running: =>
		@nodeRunning = true
		@control\running!
	success: =>
		@nodeRunning = false
		@node\finish @object
		@node = nil
	fail: =>
		@nodeRunning = false
		@node\finish @object
		@node = nil
	__tostring: =>
		return "instance of class BranchNode"

return BranchNode