require './chart'
require './gate'
require './route'
require './pending_route'
require './job'

window.flo ||= {}

class flo.Workflow extends flo.Chart
  constructor: (@id) ->
    super(@id)
    @bg.on 'dblclick', @dblclick
    @fg.on 'pending_route_added', @pendingRouteAdded

  pendingRouteAdded: (event)  =>
    @pendingRoute = event.target._flo.pendingRoute
    @highlightNodes()
    @stage.update()

  dblclick: (event) =>
    @addNode new flo.Job('######', event.stageX, event.stageY)

  clear: ->
    @routes = []
    super()

  addRoute: (route) ->
    @routes.push route
    @addEdge(route)

  addGate: (name, route) ->
    route.addGate(name)
    @stage.update()

  highlightNodes: ->
    for node in @nodes
      node.highlight()
      node.shape.on 'click', @pendingRouteDefined, @, false, { nodeA: @pendingRoute.nodeA, nodeB: node }
    @stage.update()

  pendingRouteDefined: (event, nodes) ->
    @dehighlightNodes()
    @addRoute(new flo.Route(nodes.nodeA, nodes.nodeB))

  dehighlightNodes: ->
    for node in @nodes
      node.dehighlight()
      node.shape.off 'click'
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
      @addNode new flo.Job(node.name, node.x, node.y)

    # Import routes
    for node in nodes
      for route in node.routes
        routeObj = new flo.Route(@getNode(node.name), @getNode(route.node))
        @addRoute routeObj
        @addGate route.gate, routeObj if route.gate
