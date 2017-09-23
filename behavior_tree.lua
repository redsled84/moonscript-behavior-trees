local Registry = require("registry")
local Node = require("node_types/node")
local BehaviorTree
do
  local _class_0
  local _parent_0 = Node
  local _base_0 = {
    Node = Node,
    Registry = Registry,
    Task = Node,
    BranchNode = require("node_types/branch_node"),
    Priority = require("node_types/priority"),
    ActivePriority = require("node_types/active_priority"),
    Random = require("node_types/random"),
    Sequence = require("node_types/sequence"),
    Decorator = require("node_types/decorator"),
    InvertDecorator = require("node_types/invert_decorator"),
    AlwaysFailDecorator = require("node_types/always_fail_decorator"),
    AlwaysSucceedDecorator = require("node_types/always_succeed_decorator"),
    register = (function()
      local _base_1 = Registry
      local _fn_0 = _base_1.register
      return function(...)
        return _fn_0(_base_1, ...)
      end
    end)(),
    getNode = (function()
      local _base_1 = Registry
      local _fn_0 = _base_1.getNode
      return function(...)
        return _fn_0(_base_1, ...)
      end
    end)(),
    run = function(self, object)
      if self.started then
        return Node:running()
      else
        self.started = true
        self.object = object or self.object
        self.rootNode = Registry:getNode(self.tree)
        self.rootNode:setControl(self)
        self.rootNode:start(self.object)
        return self.rootNode:call_run(self.object)
      end
    end,
    running = function(self)
      _class_0.__parent.__base.running(self)
      self.started = false
    end,
    success = function(self)
      self.rootNode:finish(self.object)
      self.started = false
      return _class_0.__parent.__base.success(self)
    end,
    fail = function(self)
      self.rootNode:finish(self.object)
      self.started = false
      return _class_0.__parent.__base.fail(self)
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, ...)
      return _class_0.__parent.__init(self, ...)
    end,
    __base = _base_0,
    __name = "BehaviorTree",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  BehaviorTree = _class_0
end
return BehaviorTree
