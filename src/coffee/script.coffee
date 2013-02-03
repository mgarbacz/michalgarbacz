# Creating image objects for the two images used for skill canvases
skillBack = new Image()
skillBack.src = 'img/skillBack.png'
skillFill = new Image()
skillFill.src = 'img/skillFill.png'

# Returns the canvas object filled to given skillLevel
drawSkillCanvas = (skillLevel) ->
  # Canvas will be the same size as our images
  skillCanvas = $('<canvas class="skill-canvas" />')
  skillCanvas.attr 'width', skillBack.width
  skillCanvas.attr 'height', skillBack.height

  # We want the skill to fill anti-clockwise
  arcLength = -(skillLevel / 100) * (Math.PI * 2)

  # Drawing the back image
  context = skillCanvas[0].getContext '2d'
  context.fillStyle = 'rgba(0, 0, 0, 0.0)'
  context.drawImage skillBack, 0, 0

  # Saving context with only background
  context.save()

  # Drawing the fill image
  context.beginPath()
  context.arc skillBack.width / 2, skillBack.height / 2, skillBack.height / 2,
    0-Math.PI / 2,arcLength-Math.PI / 2, true
  context.lineTo skillBack.width / 2, skillBack.height / 2
  context.closePath()
  context.clip()
  context.drawImage skillFill, 0, 0

  # Restoring the context with only background
  context.restore()

  # Returning the canvas object
  skillCanvas

# Once the window is done loading, prepend all listed skill canvases
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
