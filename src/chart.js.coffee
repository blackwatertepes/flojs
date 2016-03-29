require './sprite'
require './label'
require './edge'
require './node'

window.flo ||= {}

class flo.Chart
  constructor: (@id) ->
    @$canvas = $('#' + @id)
    @stage = new createjs.Stage(@id)
    @bg = new createjs.Shape()
    @fg = new createjs.MovieClip()
    @clear()

  clear: ->
    @stage.removeAllChildren()
    @nodes = []
    @edges = []
    # A background is required to mouse events
    @bg.graphics.beginFill('white').drawRect(0, 0, @$canvas.width(), @$canvas.height())
    @stage.addChild(@bg)
    @stage.addChild(@fg)
    @stage.update()

  addNode: (node) ->
    @nodes.push node
    node.chart = @
    @fg.addChild(node.shape)
    @stage.update()
    node.shape.on "pressmove", @onDrag

  onDrag: (event) =>
    event.currentTarget.x = event.stageX
    event.currentTarget.y = event.stageY
    event.currentTarget._flo.update()
    @stage.update()

  addEdge: (edge) ->
    @edges.push edge
    @fg.addChildAt(edge.shape, 0)
    @stage.update()

  getNode: (name) ->
    @nodes.find (node) ->
      node.name == name
