Registry = require "registry"
Node = require "node_types/node"

class BehaviorTree extends Node
  Node: Node
  Registry: Registry
  Task: Node
  BranchNode: require "node_types/branch_node"
  Priority: require "node_types/priority"
  ActivePriority: require "node_types/active_priority"
  Random: require "node_types/random"
  Sequence: require "node_types/sequence"
  Decorator: require "node_types/decorator"
  InvertDecorator: require "node_types/invert_decorator"
  AlwaysFailDecorator: require "node_types/always_fail_decorator"
  AlwaysSucceedDecorator: require "node_types/always_succeed_decorator"

  register: Registry\register
  getNode: Registry\getNode

  run: (object) =>
    if @started
      Node\running!
    else
      @started = true
      @object = object or @object
      @rootNode = Registry\getNode @tree
      @rootNode\setControl self
      @rootNode\start @object
      @rootNode\call_run @object
  running: =>
    super!
    @started = false
  success: =>
    @rootNode\finish @object
    @started = false
    super!
  fail: =>
    @rootNode\finish @object
    @started = false
    super!

return BehaviorTree