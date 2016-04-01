window.flo ||= {}

class flo.Gate extends flo.Sprite
  constructor: (@name, @route) ->
    super()
    @bg.graphics.beginStroke('#4cae4c').beginFill('#5cb85c').drawCircle(0, 0, 20)
    @draw()

  draw: ->
    @shape.x = @route.nodeA.x + (@route.nodeB.x - @route.nodeA.x) / 2
    @shape.y = @route.nodeA.y + (@route.nodeB.y - @route.nodeA.y) / 2
