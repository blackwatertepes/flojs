window.flo ||= {}

class flo.Route extends flo.Edge
  constructor: (@nodeA, @nodeB) ->
    @arrow = new flo.Arrow(@)
    super(@nodeA, @nodeB)
    @addChild(@arrow)

  draw: ->
    @gate.draw() if @gate
    super()
    @arrow.draw()

  addGate: (name) ->
    @gate = new flo.Gate(name, @)
    @addChild(@gate)
