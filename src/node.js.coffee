window.flo ||= {}

class flo.Node extends flo.Sprite
  constructor: (@name, @x, @y) ->
    super()
    @edges = []
    @bg.graphics.beginStroke('black').beginFill('white').drawCircle(0, 0, 40)
    @shape.x = @x
    @shape.y = @y

  addEdge: (edge) ->
    @edges.push edge

  update: ->
    @x = @shape.x
    @y = @shape.y
    for edge in @edges
      edge.draw()
