window.flo ||= {}

class flo.Start extends flo.Job
  constructor: ->
    @radius = 0
    super(@name, 0, 0)

  draw: ->
    super()
    #TODO: Find canvas element
    @y = 250
    @bg.y = -200
    @bg.graphics.beginFill('white').drawRect(0, 0, 50, 400)
    label = new flo.Label("Start", {font: "24px Arial", rotation: 90})
    @addChild(label)
