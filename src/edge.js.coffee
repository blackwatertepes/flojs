window.flo ||= {}

class flo.Edge extends flo.Sprite
  constructor: (@nodeA, @nodeB) ->
    super()
    @nodeA.addEdge(@)
    @nodeB.addEdge(@)

  draw: ->
    @bg.graphics.clear()
    @bg.graphics.beginStroke('black').moveTo(@nodeA.x, @nodeA.y).lineTo(@nodeB.x, @nodeB.y)
