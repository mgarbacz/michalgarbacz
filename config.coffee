exports.config =
  # See http://brunch.readthedocs.org/en/latest/config.html for documentation.
  paths:
    public: 'public'
  files:
    javascripts:
      joinTo:
        'js/app.js': /^app\/(?!assets)/
        'js/vendor.js': /^vendor/

    stylesheets:
      joinTo:
        'ss/app.css': /^app/
        'ss/vendor.css': /^vendor/

  plugins:
    sass:
      debug: 'comments'
