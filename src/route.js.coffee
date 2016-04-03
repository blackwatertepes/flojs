window.flo ||= {}

Route = (nodeA, nodeB) ->
  @Edge_constructor(nodeA, nodeB)

  @strokeStyle = 3
  @strokeDash = [40, 5]
  @dir = -1
  return

p = createjs.extend(Route, flo.Edge)

p.setup = ->
  @offset = 0

  clearInterval @int
  @int = setInterval =>
    @offset += @dir
    @bg.graphics.clear()
    @bg.graphics.setStrokeStyle(@strokeStyle).setStrokeDash(@strokeDash, @offset).beginStroke(@strokeColor).moveTo(@start.x, @start.y).lineTo(@end.x, @end.y)
    @stage.update() if @stage
  , 10

flo.Route = createjs.promote(Route, "Edge")
