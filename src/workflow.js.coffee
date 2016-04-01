require './chart'
require './gate'
require './route'
require './pending_route'
require './job'
require './start'

window.flo ||= {}

class flo.Workflow extends flo.Chart
  constructor: (@id) ->
    super(@id)
    @bg.on 'dblclick', @dblclick
    @fg.on 'pending_route_added', @pendingRouteAdded
    @setup()

  setup: ->
    @start = new flo.Start()
    @addChild(@start)

  pendingRouteAdded: (event)  =>
    @pendingRoute = event.target._flo.pendingRoute
    @highlightNodes()
    @stage.update()

  dblclick: (event) =>
    @addBlankJob(event.stageX, event.stageY)

  addBlankJob: (x, y) ->
    job = new flo.Job('', x, y)
    @addNode job
    blankJobEvent = new createjs.Event('blank_job_added')
    blankJobEvent['job'] = job
    @stage.dispatchEvent(blankJobEvent)

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
      node['listener'] = node.shape.on 'click', @pendingRouteDefined, @, false, { nodeA: @pendingRoute.nodeA, nodeB: node }
    @stage.update()

  pendingRouteDefined: (event, nodes) ->
    @dehighlightNodes()
    route = new flo.Route(nodes.nodeA, nodes.nodeB)
    @addRoute(route)
    newRouteEvent = new createjs.Event('new_route_added')
    newRouteEvent['route'] = route
    @stage.dispatchEvent(newRouteEvent)

  dehighlightNodes: ->
    for node in @nodes
      node.dehighlight()
      node.shape.off 'click', node['listener']
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
    @setup()
    nodes = JSON.parse(str)
    # Import nodes first
    for node in nodes
      @addNode new flo.Job(node.name, node.x, node.y)

    # Import routes
    for node in nodes
      console.log node
      if node.start
        @addRoute new flo.Route(@start, @getNode(node.name))
      for route in node.routes
        routeObj = new flo.Route(@getNode(node.name), @getNode(route.name))
        @addRoute routeObj
        @addGate route.gate, routeObj if route.gate
