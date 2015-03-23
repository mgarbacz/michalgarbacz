eastereggs = document.getElementsByClassName('hex-egg')

eastereggs[0].addEventListener('click', (e) ->
  eastereggs[0].classList.toggle('on')
)

handleHashChange = (e) ->
  console.log('%s has become %s', e.oldURL, e.newURL)

  for element in document.getElementsByClassName('hex-text')
    element.classList.remove('on')

  if window.location.hash is '#/projects'
    document.getElementById('hex-projects').classList.toggle('on')
  if window.location.hash is '#/blog'
    document.getElementById('hex-blog').classList.toggle('on')
  if window.location.hash is '#/about'
    document.getElementById('hex-about').classList.toggle('on')

window.addEventListener('hashchange', handleHashChange, false)


handlescroll = (e) ->
  hexes = document.getelementsbyclassname('hex')
  hexcontainer = document.getelementbyid('hex-container')

  if window.scrolly < -2
    hexcontainer.style.width = '797px'
  else
    hexcontainer.style.width = 811 + (window.scrolly * 7) + 'px'

  for hex in hexes
    if window.scrolly < -2
      hex.style.margintop = '28px'
      hex.style.marginbottom = '0px'
      if hex.classlist.contains('hex-offset')
        hex.style.marginleft = '53px'
      else
        hex.style.marginleft = '0px'
    else
      hex.style.margintop = 30 + window.scrolly + 'px'
      hex.style.marginbottom = 2 + window.scrolly + 'px'
      if hex.classlist.contains('hex-offset')
        hex.style.marginleft = 55 + window.scrolly + 'px'
      else
        hex.style.marginleft = 2 + window.scrolly + 'px'

  console.log(window.scrolly)

window.addeventlistener('scroll', handlescroll, false)
