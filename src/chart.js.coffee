require './sprite'
require './label'
require './edge'
require './node'
require './arrow'

window.flo ||= {}

class flo.Chart
  constructor: (@id) ->
    @$canvas = $('#' + @id)
    @stage = new createjs.Stage(@id)
    # A background is required to mouse events
    @bg = new createjs.Shape()
    @bg.graphics.beginFill('white').drawRect(0, 0, @$canvas.width(), @$canvas.height())
    @stage.addChild(@bg)
    @fg = new createjs.MovieClip()
    @stage.addChild(@fg)
    @clear()

  clear: ->
    @fg.removeAllChildren()
    @nodes = []
    @edges = []
    @stage.update()

  addNode: (node) ->
    @nodes.push node
    node.chart = @
    @addChild(node)
    node.on 'pressmove', @onDrag

  onDrag: (event) =>
    event.currentTarget.x = event.stageX
    event.currentTarget.y = event.stageY
    event.currentTarget._flo.update()
    @stage.update()

  addEdge: (edge) ->
    @edges.push edge
    @fg.addChildAt(edge.shape, 0)
    @stage.update()

  addChild: (child) ->
    @fg.addChild(child.shape)
    @stage.update()

  getNode: (name) ->
    @nodes.find (node) ->
      node.name == name
