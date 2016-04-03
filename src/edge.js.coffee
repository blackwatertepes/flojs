window.flo ||= {}

Edge = (@nodeA, @nodeB) ->
  @Container_constructor()

  @nodeOffset = 1.2
  @strokeColor = '#666'

  @nodeA.addEdge(@)
  @nodeB.addEdge(@)

  @bg = new createjs.Shape()
  @addChild(@bg)

  @update()
  return

p = createjs.extend(Edge, createjs.Container)

p.setup = ->
  @bg.graphics.clear()
  @bg.graphics.setStrokeStyle(3).beginStroke(@strokeColor).moveTo(@nodeA.x, @nodeA.y).lineTo(@nodeB.x, @nodeB.y)

p.update = ->
  @distX = @nodeB.x - @nodeA.x
  @distY = @nodeB.y - @nodeA.y
  @dist = Math.sqrt(Math.pow(@distX, 2) + Math.pow(@distY, 2))
  #TODO: Get start and end from the node
  @start = {
    x: @nodeA.x + @nodeA.radius / @dist * @distX * @nodeOffset
    y: @nodeA.y + @nodeA.radius / @dist * @distY * @nodeOffset
  }
  @end = {
    x: @nodeB.x - @nodeB.radius / @dist * @distX * @nodeOffset
    y: @nodeB.y - @nodeB.radius / @dist * @distY * @nodeOffset
  }
  @setup()

flo.Edge = createjs.promote(Edge, "Container")
