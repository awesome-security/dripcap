path = require('path')
homePath = path.join process.env['HOME'], '/.dripcap'

conf =
  homePath: homePath
  userPackagePath: path.join homePath, '/packages'
  profilePath: path.join homePath, '/profiles'
  packagePath: path.join path.dirname(__dirname), '/packages'
  electronVersion: '0.33.0'
  crashReporter:
    productName: 'dripcap'
    companyName: 'dripcap'
    submitUrl: 'https://example.com/'
    autoSubmit: false

module.exports = conf