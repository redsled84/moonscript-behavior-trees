Decorator = require "node_types/decorator"

class AlwaysSucceedDecorator extends Decorator
  success: =>
    @control\success!
  fail: =>
    @control\success!
 	__tostring: =>
		return "instance of class AlwaysSucceedDecorator"

return AlwaysSucceedDecorator