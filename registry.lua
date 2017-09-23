local Registry
do
  local _class_0
  local _base_0 = {
    registeredNodes = { },
    register = function(self, name, node)
      self.registeredNodes[name] = node
    end,
    getNode = function(self, name)
      if type(name == "string") then
        return self.registeredNodes[name]
      else
        return name
      end
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function() end,
    __base = _base_0,
    __name = "Registry"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Registry = _class_0
end
return Registry
