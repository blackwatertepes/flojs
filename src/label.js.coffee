window.flo ||= {}

class flo.Label
  constructor: (name) ->
    @shape = new createjs.Text(name, "14px Arial")
    @shape.x = @shape.getMeasuredWidth() / -2
    @shape.y = @shape.getMeasuredHeight() / -2
