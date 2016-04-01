window.flo ||= {}

class flo.Edge extends flo.Sprite
  constructor: (@nodeA, @nodeB) ->
    @NODE_OFFSET = 1.2
    @calc()
    super()
    @nodeA.addEdge(@)
    @nodeB.addEdge(@)

  calc: ->
    @start = {x: @nodeA.x, y: @nodeA.y}
    @end = {x: @nodeB.x, y: @nodeB.y}
    @distX = @end.x - @start.x
    @distY = @end.y - @start.y
    @dist = Math.sqrt(Math.pow(@distX, 2) + Math.pow(@distY, 2))
    @start.x += @nodeA.radius / @dist * @distX * @NODE_OFFSET
    @start.y += @nodeA.radius / @dist * @distY * @NODE_OFFSET
    @end.x -= @nodeB.radius / @dist * @distX * @NODE_OFFSET
    @end.y -= @nodeB.radius / @dist * @distY * @NODE_OFFSET

  draw: ->
    super()
    @calc()
    @bg.graphics.beginStroke('black').moveTo(@start.x, @start.y).lineTo(@end.x, @end.y)
