window.flo ||= {}

class flo.Sprite
  constructor: ->
    @shape = new createjs.MovieClip()
    @shape['_flo'] = @
    @bg = new createjs.Shape()
    @shape.addChild(@bg)
    @label = new flo.Label(@name, {font: "14px Arial", color: "#fff", align: "center"})
    @shape.addChild(@label.shape)
    @draw()

  draw: ->
    @bg.graphics.clear()
    if @name
      @label.text = @name
      @label.draw()
    if @shape.stage
      @shape.stage.update()

  addChild: (child) ->
    @shape.addChild(child.shape)

  on: (event, func) ->
    @shape.on event, func
