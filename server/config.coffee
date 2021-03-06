env = process.env.NODE_ENV || 'development'
_ = require 'underscore'

config =
  default:
    buckets:
      adminSegment: 'admin'
      apiSegment: 'api'
      salt: 'BUCKETS4LIFE!!1'
      port: process.env.PORT || 3000
      env: env
      templatePath: "#{__dirname}/../user/templates/"
      publicPath: "#{__dirname}/../user/public/"
      pluginsPath: "#{__dirname}/../node_modules/"
      catchAll: yes
    db: "mongodb://localhost/buckets_#{env}"
  production:
    smtp:
      service: 'Mandrill'
      auth:
        user: process.env.MANDRILL_USERNAME
        pass: process.env.MANDRILL_APIKEY
    db: process.env.MONGOHQ_URL
  development:
    smtp:
      service: 'Gmail'
      auth:
        user: 'your.email@gmail.com'
        pass: 'PASSWORD'

module.exports = if config[env]?
  _.defaults(config[env], config.default)
else
  config.default
