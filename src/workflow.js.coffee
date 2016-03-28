require './chart'
require './gate'
require './route'
require './job'

window.flo ||= {}

class flo.Workflow extends flo.Chart
  constructor: (@id) ->
    super(@id)

  clear: ->
    @routes = []
    super()

  addRoute: (route) ->
    @routes.push route
    @addEdge(route)

  addGate: (name, route) ->
    route.addGate(name)
    @stage.update()

  export: (nodes) =>
    JSON.stringify @nodes.map (node) ->
      {
        name: node.name
        routes: node.routesTo()
        x: node.x
        y: node.y
      }

  import: (str) ->
    @clear()
    nodes = JSON.parse(str)
    # Import nodes first
    for node in nodes
      @addNode new flo.Node(node.name, node.x, node.y)

    # Import routes
    for node in nodes
      for route in node.routes
        routeObj = new flo.Route(@getNode(node.name), @getNode(route.node))
        @addRoute routeObj
        @addGate route.gate, routeObj if route.gate
