local BT = require("behavior_tree")
local count
local looking = BT.Task()
looking.run = function()
  print("looking")
  return looking:success()
end
local runningTask = BT.Task()
runningTask.run = function()
  print("running")
  if count == 10 then
    return runningTask:success()
  else
    return runningTask:running()
  end
end
BT.register("looking", looking)
BT.register("running", runningTask)
local frank = BT({
  tree = BT.Sequence({
    nodes = {
      "looking",
      "running"
    }
  })
})
for i = 1, 20 do
  count = i
  frank:run()
end
