express = require('express')
app = express()

// respond with "hello world" when a GET request is made to the homepage
app.get('/', (req, res) ->
  res.send('hello world')

app.listen(4000, (req, res) ->
  console.log('listening!')