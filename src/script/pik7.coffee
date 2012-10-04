require ['polyfill/bind', 'lib/vendor/almond',
         'app', 'slides',
         'jquery', 'prefixfree'], (_bind, _almond, App, Slides) ->



  # If the page looks like an app frame, it's probably just that
  if $('#PikApp').length > 0

    # Initialize with default values
    app = new App {
      file: 'core/welcome.html'
      slide: 0
      hidden: no
      numSlides: 1
    }

    # Change the page title when a new presentation loads
    app.on 'load', ->
      presentationTitle = $('iframe')[0].contentWindow.$('title').text()
      $('title').text(presentationTitle)

    # Reload link
    $('.reloadLink').click ->
      $('iframe')[0].contentWindow.location.reload(true)

    # Print link
    $('.printLink').click ->
      printPath = $('iframe')[0].contentWindow.location.href + '#print'
      window.open(printPath)


  # otherwise it's obviously a slide set
  else
    slides = new Slides()