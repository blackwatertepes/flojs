require './node'
require './circle'
require './box'
require './edge'
require './route'

window.flo ||= {}

Chart = (id) ->
  @Stage_constructor(id)

  @$canvas = $('#' + id)
  @width = @$canvas.width()
  @height = @$canvas.height()
  @nodes = []
  @edges = []

  # A background is required for mouse events
  @bg = new createjs.Shape()
  @bg.graphics.beginFill('white').drawRect(0, 0, @width, @height)
  @addChild(@bg)

  return

p = createjs.extend(Chart, createjs.Stage)

p.addChild = (child) ->
  #TODO: Add chart ref
  @Stage_addChild(child)

p.addNode = (node) ->
  @nodes.push node
  @addChild(node)
  node.on 'pressmove', @onDrag
  node.on 'dblclick', @onDblClick

p.addEdge = (edge) ->
  @edges.push edge
  @addChild(edge)

# Listeners
p.onDblClick = (event) ->
  event.currentTarget.toggle()
  @update()

p.onDrag = (event) =>
  event.currentTarget.x = event.stageX
  event.currentTarget.y = event.stageY
  event.currentTarget.update()

flo.Chart = createjs.promote(Chart, "Stage")
