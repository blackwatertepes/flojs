window.flo ||= {}

Box = (attrs={}) ->
  @Node_constructor(attrs)
  return

p = createjs.extend(Box, flo.Node)

p.setup = ->
  @bg.graphics.clear()
  if @active
    @bg.graphics.beginStroke(@strokeColor).beginFill(@activeColor).drawRect(-@radius, -@radius, @radius*2, @radius*2)
  else
    @bg.graphics.beginStroke(@strokeColor).beginFill(@fillColor).drawRect(-@radius, -@radius, @radius*2, @radius*2)

flo.Box = createjs.promote(Box, "Node")
