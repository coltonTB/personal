express = require('express')
app = express()

app.get('/', (req, res) ->
  res.send('hello world')

app.listen(4000, (req, res) ->
  console.log('listening!')