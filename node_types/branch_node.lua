local Registry = require("registry")
local Node = require("node_types/node")
local BranchNode
do
  local _class_0
  local _parent_0 = Node
  local _base_0 = {
    start = function(self, object)
      if not self.nodeRunning then
        local _
        do
          local _base_1 = self.setObject
          local _fn_0 = _base_1.object
          _ = function(...)
            return _fn_0(_base_1, ...)
          end
        end
        self.actualTask = 1
      end
    end,
    run = function(self, object)
      if self.actualTask <= #self.nodes then
        return self:_run(object)
      end
    end,
    _run = function(self, object)
      if not self.nodeRunning then
        self.node = Registry:getNode(self.nodes[self.actualTask])
        self.node:start(object)
        self.node:setControl(self)
      end
      return self.node:run(object)
    end,
    running = function(self)
      self.nodeRunning = true
      return self.control:running()
    end,
    success = function(self)
      self.nodeRunning = false
      self.node:finish(self.object)
      self.node = nil
    end,
    fail = function(self)
      self.nodeRunning = false
      self.node:finish(self.object)
      self.node = nil
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, ...)
      return _class_0.__parent.__init(self, ...)
    end,
    __base = _base_0,
    __name = "BranchNode",
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
  BranchNode = _class_0
end
return BranchNode
