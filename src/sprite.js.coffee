window.flo ||= {}

class flo.Sprite
  constructor: ->
    @shape = new createjs.MovieClip()
    @shape['_flo'] = @
    @bg = new createjs.Shape()
    @shape.addChild(@bg)
    if @name
      @label = new flo.Label(@name)
      @shape.addChild(@label.shape)
    @draw()

  draw: ->
    @bg.graphics.clear()

  addChild: (child) ->
    @shape.addChild(child.shape)
