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


handleScroll = (e) ->
  hexes = document.getElementsByClassName('hex')
  hexContainer = document.getElementById('hex-container')

  if window.scrollY < -2
    hexContainer.style.width = '797px'
  else
    hexContainer.style.width = 811 + (window.scrollY * 7) + 'px'

  for hex in hexes
    if window.scrollY < -2
      hex.style.marginTop = '28px'
      hex.style.marginBottom = '0px'
      if hex.classList.contains('hex-offset')
        hex.style.marginLeft = '53px'
      else
        hex.style.marginLeft = '0px'
    else
      hex.style.marginTop = 30 + window.scrollY + 'px'
      hex.style.marginBottom = 2 + window.scrollY + 'px'
      if hex.classList.contains('hex-offset')
        hex.style.marginLeft = 55 + window.scrollY + 'px'
      else
        hex.style.marginLeft = 2 + window.scrollY + 'px'

  console.log(window.scrollY)

window.addEventListener('scroll', handleScroll, false)
