Decorator = require "node_types/decorator"

class InvertDecorator extends Decorator
  success: =>
    @control\fail!
  fail: =>
    @control\success!

return InvertDecorator