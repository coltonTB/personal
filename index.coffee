express = require('express')

app = express()

app.use require('./site')

app.listen 8080, (req, res) ->
  console.log('listening!')