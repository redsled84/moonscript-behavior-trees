BT = require "behavior_tree"
local count

looking = BT.Task!
looking.run = () ->
  print "looking"
  looking\success!
runningTask = BT.Task!
runningTask.run = () ->
  print "running"
  if count == 10
    runningTask\success!
  else
    runningTask\running!

BT.register "looking", looking
BT.register "running", runningTask

frank = BT {
  tree: BT.Sequence {
    nodes: {
      "looking", "running"
    }
  }
}

for i = 1, 20
  count = i
  frank\run!