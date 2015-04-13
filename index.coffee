express = require('express')
exphbs  = require('express-handlebars')

app = express()

app.engine '.hbs', exphbs
  extname: 'hbs'
  defaultLayout: 'main'
  partialsDir: './views/partials'

app.set('view engine', '.hbs');
app.set('views', './views');

app.use express.static './public'

app.get '/', (req, res) ->
  res.locals.test = 'hello'
  res.render 'index'

app.get '/projects', (req, res) ->
  res.locals.test = 'hello'
  res.render 'index'

app.get '/resume', (req, res) ->
  res.locals.test = 'hello'
  res.render 'index'

app.get '/blog', (req, res) ->
  res.locals.test = 'hello'
  res.render 'index'

app.listen 8080, (req, res) ->
  console.log('listening!')