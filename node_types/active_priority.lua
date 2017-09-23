local Registry = require("registry")
local Priority = require("node_types/priority")
local ActivePriority
do
  local _class_0
  local _parent_0 = Priority
  local _base_0 = {
    success = function(self)
      self:_finishRunningNode()
      self.runningTask = nil
      return _class_0.__parent.__base.success(self)
    end,
    fail = function(self)
      if self.runningTask == self.actualTask then
        self.runningTask = nil
      end
      return _class_0.__parent.__base.fail(self)
    end,
    running = function(self)
      self:_finishRunningNode()
      self.runningTask = self.actualTask
      self.control:running()
      self.actualTask = 1
    end,
    _finishRunningNode = function(self)
      if self.runningTask and self.runningTask > self.actualTask then
        local runningNode
        runningNode = Registry:getNode(self.nodes[self.runningTask])
        return runningNode:finish()
      end
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, ...)
      return _class_0.__parent.__init(self, ...)
    end,
    __base = _base_0,
    __name = "ActivePriority",
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
  ActivePriority = _class_0
end
return ActivePriority
