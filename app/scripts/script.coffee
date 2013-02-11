resizeContainers = () ->
  introSize = $('#intro-container').width()
  $('.skills').width introSize / 2 - 1 if introSize > 479 and introSize < 945
  $('.skills').width introSize if introSize < 480

$(window).resize ->
  resizeContainers()

$ ->
  resizeContainers()
