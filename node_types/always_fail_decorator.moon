Decorator = require "node_types/decorator"

class AlwaysFailDecorator extends Decorator
  success: =>
    @control\fail!
  fail: =>
    @control\fail!
 	__tostring: =>
		return "instance of class AlwaysFailDecorator"

return AlwaysFailDecorator