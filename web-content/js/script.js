"use strict";

$('#link-github').hover(
  function() {
    $(this).html('github');
  }, function() {
    $(this).html('gh');
});
$('#link-stackoverflow').hover(
  function() { 
    $(this).html('stackoverflow'); 
  }, function() { 
    $(this).html('so');
});

var img1 = new Image();
img1.src = 'img/v1.png';
var img2 = new Image();
img2.src = 'img/v2.png';

function drawSkillCanvas(skillLevel) {
  var skillCanvas= $('<canvas class="skill-canvas" />');
  skillCanvas.attr('width', img1.width);
  skillCanvas.attr('height', img1.height);

  var context = skillCanvas[0].getContext('2d');
  var i = skillLevel*(Math.PI*2)/100;
  var j = 0;
  context.fillStyle = 'rgba(0,0,0,0.0)';
  context.clearRect(0,0,img1.width,img1.height);
  context.save();
  context.drawImage(img1, 0, 0);
  context.beginPath();
  context.lineWidth = 5;
  context.arc(img1.width/2,img1.height/2,img1.height/2,i-Math.PI/2,j-Math.PI/2,true);
  context.lineTo(img1.width/2,img1.height/2);
  context.closePath();
  context.fill();
  context.clip();
  context.drawImage(img2,0,0);
  context.restore();

  return skillCanvas;
}

window.onload = init;
function init() {
  $('#skill-ruby').prepend(drawSkillCanvas(70));
  $('#skill-python').prepend(drawSkillCanvas(65));
  $('#skill-javascript').prepend(drawSkillCanvas(95));
  $('#skill-erlang').prepend(drawSkillCanvas(40));
}