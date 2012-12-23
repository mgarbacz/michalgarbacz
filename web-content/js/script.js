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

// Initializing image objects of source images for use in skill level canvases
var skillBack = new Image();
skillBack.src = 'img/skillBack.png';
var skillFill = new Image();
skillFill.src = 'img/skillFill.png';

// Draws the given skill level onto a canvas element
// skillLevel should be an integer - 1 to 100
function drawSkillCanvas(skillLevel) {
  // Initialize our canvas, giving it a size equal to the source images
  var skillCanvas= $('<canvas class="skill-canvas" />');
  skillCanvas.attr('width', skillBack.width);
  skillCanvas.attr('height', skillBack.height);

  // Using the skillLevel to set arc length
  var arcLength = -(skillLevel/100)*(Math.PI*2);

  // Taking care of details
  var context = skillCanvas[0].getContext('2d');
  context.fillStyle = 'rgba(0,0,0,0.0)';
  context.clearRect(0,0,skillBack.width,skillBack.height);
  context.save();
  context.drawImage(skillBack, 0, 0);
  context.beginPath();
  context.lineWidth = 5;
  context.arc(skillBack.width/2,skillBack.height/2,skillBack.height/2,
    0-Math.PI/2,arcLength-Math.PI/2,true);
  context.lineTo(skillBack.width/2,skillBack.height/2);
  context.closePath();
  context.fill();
  context.clip();
  context.drawImage(skillFill,0,0);
  context.restore();

  return skillCanvas;
}

window.onload = init;
function init() {
  $('#skill-python').prepend(drawSkillCanvas(50));
  $('#skill-ruby').prepend(drawSkillCanvas(70));
  $('#skill-rails').prepend(drawSkillCanvas(70));
  $('#skill-javascript').prepend(drawSkillCanvas(90));
  $('#skill-jquery').prepend(drawSkillCanvas(90));
  $('#skill-backbonejs').prepend(drawSkillCanvas(50));
  $('#skill-nodejs').prepend(drawSkillCanvas(40));
  $('#skill-coffeescript').prepend(drawSkillCanvas(20));
  $('#skill-java').prepend(drawSkillCanvas(70));
  $('#skill-android').prepend(drawSkillCanvas(50));
  $('#skill-csharp').prepend(drawSkillCanvas(30));
  $('#skill-cplusplus').prepend(drawSkillCanvas(30));
  $('#skill-erlang').prepend(drawSkillCanvas(40));
  $('#skill-scala').prepend(drawSkillCanvas(40));
  $('#skill-mysql').prepend(drawSkillCanvas(60));
  $('#skill-postgresql').prepend(drawSkillCanvas(40));
  $('#skill-sqlite').prepend(drawSkillCanvas(70));
  $('#skill-mongodb').prepend(drawSkillCanvas(70));
}