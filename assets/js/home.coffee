---
---

(($) ->
  $animateIn       = $('.animate-in')
  $animateOut      = $('.animate-out')
  animateInOffset  = 100
  animateOutOffset = 200

  $animateIn.addClass  'pre-animate'
  $animateOut.addClass 'pre-animate-out'

  $(window).scroll (e) ->
    windowHeight         = $(window).height()
    windowScrollPosition = $(window).scrollTop()
    bottomScrollPosition = windowHeight + windowScrollPosition

    $animateIn.each (i, element) ->
      if $(element).offset().top + animateInOffset < bottomScrollPosition
        $(element).removeClass 'pre-animate'

    $animateOut.each (i, element) ->
      if $(element).offset().top + animateOutOffset < bottomScrollPosition
        $(element).removeClass 'pre-animate-out'
        
) jQuery
