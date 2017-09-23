Registry = require "registry"
Node = require "node_types/node"

class Decorator extends Node
  new: (config) =>
    super config
    @node = Registry\getNode @node
  setNode: (node) =>
    @node = Registry\getNode node
  start: (object) =>
    @node\start object
  finish: (object) =>
    @node\finish object
  run: (object) =>
    @node\setControl self
    @node\call_run object

return Decorator