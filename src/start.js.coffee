window.flo ||= {}

class flo.Start extends flo.Job
  constructor: ->
    super(@name, 0, 0)

  draw: ->
    @radius = 0
    super()
    #TODO: Find canvas element
    @y = 250
    @bg.y = -200
    @bg.graphics.beginStroke('#4cae4c').beginFill('#5cb85c').drawRect(0, 0, 50, 400)
    label = new flo.Label("Start", {font: "24px Arial", color: "#fff", rotation: 90})
    @addChild(label)
