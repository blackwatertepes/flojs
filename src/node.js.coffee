window.flo ||= {}

Node = (attrs={}) ->
  @Container_constructor()

  @strokeColor = '#2e6da4'
  @fillColor = '#337ab7'
  @activeColor = '#49e'
  @radius = 30
  @active = false
  @edges = []

  for key, val of attrs
    @[key] = val

  @bg = new createjs.Shape()
  @addChild(@bg)

  @setup()
  return

p = createjs.extend(Node, createjs.Container)

p.setup = ->
  @bg.graphics.clear()
  if @active
    @bg.graphics.beginStroke(@strokeColor).beginFill(@activeColor).drawCircle(0, 0, @radius)
  else
    @bg.graphics.beginStroke(@strokeColor).beginFill(@fillColor).drawCircle(0, 0, @radius)

p.toggle = ->
  @active = !@active
  @setup()

p.addEdge = (edge) ->
  @edges.push edge

p.update = ->
  for edge in @edges
    edge.update()

flo.Node = createjs.promote(Node, "Container")
