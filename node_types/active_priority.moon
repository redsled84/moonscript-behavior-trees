Registry = require "registry"
Priority = require "node_types/priority"

class ActivePriority extends Priority
  success: =>
    @_finishRunningNode!
    @runningTask = nil
    super!
  fail: =>
    if @runningTask == @actualTask
      @runningTask = nil
    super!
  running: =>
    @_finishRunningNode!
    @runningTask = @actualTask
    @control\running!
    @actualTask = 1
  _finishRunningNode: =>
    if @runningTask and @runningTask > @actualTask
      local runningNode
      runningNode = Registry\getNode @nodes[@runningTask]
      runningNode\finish!

return ActivePriority