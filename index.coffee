express = require('express')

app = express()

app.use require('./site')
# app.use require('./api')

app.listen 8080, (req, res) ->
  console.log('listening!')