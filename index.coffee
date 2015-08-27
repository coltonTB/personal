express = require('express')

app = express()

app.use (req, res, next) ->
  res.setHeader "Cache-Control", "public, max-age=#{60*60*60}"
  next()

app.use require('./site')

app.listen 8080, (req, res) ->
  console.log('listening on port 8080')
