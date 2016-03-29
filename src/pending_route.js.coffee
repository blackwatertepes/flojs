window.flo ||= {}

class flo.PendingRoute extends flo.Route
  constructor: (@nodeA) ->
    super(@nodeA, @nodeA)
