express = require('express')
exphbs  = require('express-handlebars')

app = express()

hbs = exphbs.create
  extname: 'hbs'
  defaultLayout: 'main'
  layoutsDir: './site/views/layouts'
  partialsDir: "./site/views/partials"
  helpers:
    selected: (ctx, options) -> 
      if this.path is ctx then 'selected'

app.engine '.hbs', hbs.engine

app.set('view engine', '.hbs');
app.set('views', "./site/views");

app.use (req, res, next) ->
  res.locals.path = req.originalUrl.replace(/^\//, '')
  do next

app.use express.static './public'

app.get '/', (req, res) ->
  res.render 'index'

app.get '/projects', (req, res) ->
  res.render 'index'

app.get '/resume', (req, res) ->
  res.locals.test = 'hello'
  res.render 'index'

app.get '/blog', (req, res) ->
  res.locals.test = 'hello'
  res.render 'index'

module.exports = app