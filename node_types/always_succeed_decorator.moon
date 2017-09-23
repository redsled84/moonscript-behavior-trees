Decorator = require "node_types/decorator"

class AlwaysSucceedDecorator extends Decorator
  success: =>
    @control\success!
  fail: =>
    @control\success!

return AlwaysSucceedDecorator