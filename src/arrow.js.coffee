window.flo ||= {}

class flo.Arrow extends flo.Sprite
  constructor: (@edge, @size= 10) ->
    super()

  draw: ->
    super()
    if @edge.end
      @shape.x = @edge.end.x
      @shape.y = @edge.end.y
      angle = Math.atan2(@edge.distY, @edge.distX)
      @shape.rotation = 180 * angle / Math.PI + 135
      @bg.graphics.beginStroke('#000')
      @bg.graphics.moveTo(0, 0).lineTo(@size, 0)
      @bg.graphics.moveTo(0, 0).lineTo(0, @size)
