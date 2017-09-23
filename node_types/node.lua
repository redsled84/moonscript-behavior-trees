local Registry = require("registry")
local Node
do
  local _class_0
  local _base_0 = {
    start = function(self) end,
    finish = function(self) end,
    run = function(self) end,
    call_run = function(self, object)
      local success
      success = function()
        return self:success()
      end
      local fail
      fail = function()
        return self:fail()
      end
      local running
      running = function()
        return self:running()
      end
      self:run(object)
      success, fail, running = nil, nil, nil
    end,
    setObject = function(self, object)
      self.object = object
    end,
    setControl = function(self, control)
      self.control = control
    end,
    running = function(self)
      if self.control then
        return self.control:running(self)
      end
    end,
    success = function(self)
      if self.control then
        return self.control:success()
      end
    end,
    fail = function(self)
      if self.control then
        return self.control:fail()
      end
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, config)
      if config == nil then
        config = { }
      end
      for k, v in pairs(config) do
        self[k] = v
      end
      if self.name ~= nil then
        return Registry:register(self.name, self)
      end
    end,
    __base = _base_0,
    __name = "Node"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Node = _class_0
end
return Node
