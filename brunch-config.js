module.exports = {
  notifications: false,
  paths: {
    public: 'public'
  },
  files: {
    javascripts: {
      joinTo: {
        'javascripts/app.js': /^app/
      }
    },
    stylesheets: {
      joinTo: {
        'stylesheets/app.css': /^app\/styles/
      }
    }
  },
  server: {
    hostname: '0.0.0.0'
  }
};
