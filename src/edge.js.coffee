window.flo ||= {}

class flo.Edge extends flo.Sprite
  constructor: (@nodeA, @nodeB) ->
    super()
    @nodeA.addEdge(@)
    @nodeB.addEdge(@)

  draw: ->
    super()
    @bg.graphics.beginStroke('black').moveTo(@nodeA.x, @nodeA.y).lineTo(@nodeB.x, @nodeB.y)
