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
    @draw() if @draw

  addChild: (child) ->
    @shape.addChild(child.shape)
