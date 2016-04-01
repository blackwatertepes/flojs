window.flo ||= {}

class flo.Node extends flo.Sprite
  constructor: (@name, @x, @y) ->
    @chart = null
    @radius = 40
    super()
    @edges = []
    @shape.x = @x
    @shape.y = @y

  draw: ->
    super()
    @bg.graphics.beginStroke('black').beginFill('white').drawCircle(0, 0, @radius)
    if @shape.stage
      @shape.stage.update()

  addEdge: (edge) ->
    @edges.push edge

  update: ->
    @x = @shape.x
    @y = @shape.y
    for edge in @edges
      edge.draw()

  highlight: ->
    @bg.graphics.beginFill('#EEFFEE').drawCircle(0, 0, 39)

  dehighlight: ->
    @draw()
