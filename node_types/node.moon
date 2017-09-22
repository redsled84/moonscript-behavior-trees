local _PACKAGE
_PACKAGE  = (...)\match("^(.+)[%./][^%./]+")\gsub("[%./]?node_types", "")
Registry = require _PACKAGE.."registry"

class Node
	new: (config={}) =>
		for k, v in pairs(config)
			self[k] = v
		if @name ~= nil
			Registry\register @name, self
	start: =>
	finish: =>
	run: =>
	call_run: (object) =>
		success = -> @success!
		fail = ->    @fail!
		running = -> @running!
		@run object
		success, fail, running = nil, nil, nil
	setObject: (object) =>
		@object = object
	setControl: (control) =>
		@control = control
	running: =>
		if @control
			@control\running self
	success: =>
		if @control
			@control\success!
	fail: =>
		if @control
			@control\fail!
