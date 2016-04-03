window.flo ||= {}

Circle = (attrs={}) ->
  @Node_constructor(attrs)
  return

p = createjs.extend(Circle, flo.Node)

p.setup = ->
  @bg.graphics.clear()
  if @active
    @bg.graphics.beginStroke(@strokeColor).beginFill(@activeColor).drawCircle(0, 0, @radius)
  else
    @bg.graphics.beginStroke(@strokeColor).beginFill(@fillColor).drawCircle(0, 0, @radius)

flo.Circle = createjs.promote(Circle, "Node")
