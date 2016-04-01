window.flo ||= {}

class flo.Job extends flo.Node
  constructor: (@name, @x, @y) ->
    super(@name, @x, @y)
    @on 'dblclick', @addPendingRoute

  addPendingRoute: (event) =>
    @pendingRoute = new flo.PendingRoute(@)
    @shape.dispatchEvent('pending_route_added', true)

  addRoute: (route) ->
    @addEdge(route)

  updateLabel: (label) ->
    @name = label
    @draw()

  routesTo: ->
    @edges.filter (route) =>
      route.nodeA == @
    .map (route) =>
      {
        node: route.nodeB.name
        gate: route.gate.name if route.gate
      }
