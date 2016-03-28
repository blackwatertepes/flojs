require './sprite'
require './label'
require './edge'
require './node'

window.flo ||= {}

class flo.Chart
  constructor: (@id) ->
    @stage = new createjs.Stage(@id)
    @clear()

  clear: ->
    @stage.removeAllChildren()
    @nodes = []
    @edges = []
    @stage.update()

  addNode: (node) ->
    @nodes.push node
    @stage.addChild(node.shape)
    @stage.update()
    node.shape.addEventListener("pressmove", @onDrag)

  onDrag: (event) =>
    event.currentTarget.x = event.stageX
    event.currentTarget.y = event.stageY
    event.currentTarget._flo.update()
    @stage.update()

  addEdge: (edge) ->
    @edges.push edge
    @stage.addChildAt(edge.shape, 0)
    @stage.update()

  getNode: (name) ->
    @nodes.find (node) ->
      node.name == name
