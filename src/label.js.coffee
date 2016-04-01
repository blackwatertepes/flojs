window.flo ||= {}

class flo.Label
  constructor: (@text='', @options={font: "14px Arial", color: "#000", align: "center", rotation: 0}) ->
    @shape = new createjs.Text(@text, @options.font, @options.color)
    @draw()

  draw: ->
    @shape.text = @text
    if @options.rotation
      @shape.rotation = @options.rotation
      @shape.x = 40
      @shape.y = -20
    if @options.align == 'center'
      @shape.x = @shape.getMeasuredWidth() / -2
      @shape.y = @shape.getMeasuredHeight() / -2
