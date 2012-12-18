"use strict";

$('#a-github').hover(
  function() {
    $(this).html('github');
  }, function() {
    $(this).html('gh');
});
$('#a-stackoverflow').hover(
  function() { 
    $(this).html('stackoverflow'); 
  }, function() { 
    $(this).html('so');
});

window.onload = init;
function init() {
  var img1 = new Image();
  img1.src = 'img/v1.png';
  var img2 = new Image();
  img2.src = 'img/v2.png';
  var canvas_ruby = $('<canvas />');
  var ctx = canvas_ruby[0].getContext("2d");
  var i = 66*(Math.PI*2)/100;
  var j = 0;
    ctx.fillStyle = "rgba(0,0,0,0.0)";
    ctx.clearRect(0,0,img1.width,img1.height);
    ctx.save();
    ctx.drawImage(img1, 0, 0);
      ctx.beginPath();
      ctx.lineWidth = 5;
      ctx.arc(img1.width/2,img1.height/2,img1.height/2,i-Math.PI/2,j-Math.PI/2,true);
      ctx.lineTo(img1.width/2,img1.height/2);
      ctx.closePath();
      ctx.fill();
      ctx.clip();
      ctx.drawImage(img2,0,0);
    ctx.restore();

  $('#skill-ruby').append(canvas_ruby);
}