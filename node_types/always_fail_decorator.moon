Decorator = require "node_types/decorator"

class AlwaysFailDecorator extends Decorator
  success: =>
    @control\fail!
  fail: =>
    @control\fail!

return AlwaysFailDecorator