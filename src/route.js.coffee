window.flo ||= {}

class flo.Route extends flo.Edge
  constructor: (@nodeA, @nodeB) ->
    super(@nodeA, @nodeB)

  draw: ->
    @gate.draw() if @gate
    super()

  addGate: (name) ->
    @gate = new flo.Gate(name, @)
    @addChild(@gate)
