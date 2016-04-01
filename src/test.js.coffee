Test = (label, color) ->
  @Container_constructor()

  @color = 'red'
  @label = label

  @setup()
  return

p = createjs.extend(Test, createjs.Container)

p.setup = ->
  text = new createjs.Text(@label, "20px Arial", "#000")
  text.textBaseline = "top"
  text.textAlign = "center"

  width = text.getMeasuredWidth()+30
  height = text.getMeasuredHeight()+20

  text.x = width/2
  text.y = 10

  background = new createjs.Shape()
  background.graphics.beginFill(@color).drawRoundRect(0,0,width,height,10)

  @addChild(background, text)

window.Test = createjs.promote(Test, "Container")
