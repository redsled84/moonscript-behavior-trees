BranchNode = require "node_types/branch_node"

class Priority extends BranchNode
  success: =>
    super!
    @control\success!
  fail: =>
    super!
    @actualTask += 1
    if @actualTask <= #@nodes
      @_run @object
    else
      @control\fail!

return Priority