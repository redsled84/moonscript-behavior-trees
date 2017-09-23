local Registry = require("registry")
local Node = require("node_types/node")
local Decorator
do
  local _class_0
  local _parent_0 = Node
  local _base_0 = {
    setNode = function(self, node)
      self.node = Registry:getNode(node)
    end,
    start = function(self, object)
      return self.node:start(object)
    end,
    finish = function(self, object)
      return self.node:finish(object)
    end,
    run = function(self, object)
      self.node:setControl(self)
      return self.node:call_run(object)
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, config)
      _class_0.__parent.__init(self, config)
      self.node = Registry:getNode(self.node)
    end,
    __base = _base_0,
    __name = "Decorator",
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
  Decorator = _class_0
end
return Decorator
