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
  else if window.location.hash is '#/blog'
    document.getElementById('hex-blog').classList.toggle('on')
  else if window.location.hash is '#/about'
    document.getElementById('hex-about').classList.toggle('on')

window.addEventListener('hashchange', handleHashChange, false)

handleHashChange({})
