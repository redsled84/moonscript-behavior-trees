class Registry
	registeredNodes: {}
	register: (name, node) =>
		@registeredNodes[name] = node
	getNode: (name) =>
		if type name == "string"
			return registeredNodes[name]
		else
			return name