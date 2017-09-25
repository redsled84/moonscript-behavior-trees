Decorator = require "node_types/decorator"

class InvertDecorator extends Decorator
  success: =>
    @control\fail!
  fail: =>
    @control\success!
  __tostring: =>
		return "instance of class InvertDecorator"

return InvertDecorator