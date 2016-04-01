(function(){
  Button = function(label, color) {
    this.Container_constructor();

    this.color = 'red';
    this.label = label;

    var text = new createjs.Text(this.label, "20px Arial", "#000");
    text.textBaseline = "top";
    text.textAlign = "center";

    var width = text.getMeasuredWidth()+30;
    var height = text.getMeasuredHeight()+20;

    text.x = width/2;
    text.y = 10;

    var background = new createjs.Shape();
    background.graphics.beginFill(this.color).drawRoundRect(0,0,width,height,10);
    console.log(this)

    this.addChild(background, text); 
  }

  var p = createjs.extend(Button, createjs.Container);

  window.Button = createjs.promote(Button, "Container");
})()
