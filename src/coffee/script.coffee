skillBack = new Image()
skillBack.src = 'img/skillBack.png'
skillFill = new Image()
skillFill.src = 'img/skillFill.png'

drawSkillCanvas = (skillLevel) ->
  skillCanvas = $('<canvas class="skill-canvas" />')
  skillCanvas.attr 'width', skillBack.width
  skillCanvas.attr 'height', skillBack.height

  arcLength = -(skillLevel / 100) * (Math.PI * 2)

  context = skillCanvas[0].getContext '2d'
  context.fillStyle = 'rgba(0, 0, 0, 0.0)'
  context.drawImage skillBack, 0, 0

  context.beginPath()
  context.arc skillBack.width / 2, skillBack.height / 2, skillBack.height / 2,
    0-Math.PI / 2,arcLength-Math.PI / 2, true
  context.lineTo skillBack.width / 2, skillBack.height / 2
  context.closePath()
  context.clip()
  context.drawImage skillFill, 0, 0

  skillCanvas

window.onload = ->
  $('#skill-python').prepend        drawSkillCanvas 50
  $('#skill-ruby').prepend          drawSkillCanvas 70
  $('#skill-rails').prepend         drawSkillCanvas 70
  $('#skill-javascript').prepend    drawSkillCanvas 90
  $('#skill-jquery').prepend        drawSkillCanvas 90
  $('#skill-backbonejs').prepend    drawSkillCanvas 50
  $('#skill-nodejs').prepend        drawSkillCanvas 40
  $('#skill-coffeescript').prepend  drawSkillCanvas 20
  $('#skill-java').prepend          drawSkillCanvas 70
  $('#skill-android').prepend       drawSkillCanvas 50
  $('#skill-csharp').prepend        drawSkillCanvas 30
  $('#skill-cplusplus').prepend     drawSkillCanvas 30
  $('#skill-erlang').prepend        drawSkillCanvas 40
  $('#skill-scala').prepend         drawSkillCanvas 40
  $('#skill-mysql').prepend         drawSkillCanvas 60
  $('#skill-postgresql').prepend    drawSkillCanvas 40
  $('#skill-sqlite').prepend        drawSkillCanvas 70
  $('#skill-mongodb').prepend       drawSkillCanvas 70
