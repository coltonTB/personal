express = require('express')
exphbs  = require('express-handlebars')
cm = require '../cm.coffee'
fs = require 'fs'

app = express()

hbs = exphbs.create
  extname: 'hbs'
  defaultLayout: 'main'
  layoutsDir: './site/views/layouts'
  partialsDir: "./site/views/partials"
  helpers:
    selected: (ctx, opts) ->
      regex = new RegExp('^'+ctx+'(/.*)?$')
      if regex.test(this.path) then 'selected'
    fragment: (opts) ->
      frags = this.path.split('/')
      frags[frags.length-1]

app.use (req, res, next) ->
  res.locals.path = req.originalUrl.replace(/^\//, '')
  do next


app.engine '.hbs', hbs.engine

app.set('view engine', '.hbs');
app.set('views', "./site/views");

app.use express.static './public'

app.get '/', (req, res) ->
  res.render 'home', content: cm('home.md')

app.get '/projects', (req, res) ->
  res.render 'projects', 
    content: cm('projects.md')

app.get '/projects/:id', (req, res) ->
  res.render 'project', 
    layout: 'project'
    content: cm("projects/#{req.params.id}.md")

app.get '/resume', (req, res) ->
  res.render 'resume', content: cm('resume.md')



app.get '/dl/resume.html', (req, res) ->
  res.render 'resume', 
    layout: 'resume-raw-html',
    content: cm('resume.md')

app.get '/dl/resume.pdf', (req, res) ->
  res.setHeader 'Content-Type', 'application/pdf'
  fs.createReadStream('./coltonBrownResume.pdf')
    .pipe(res);

app.get '/dl/resume.md', (req, res) ->
  res.setHeader 'Content-Type', 'application/text'
  fs.createReadStream('./content/resume.md')
    .pipe(res);

module.exports = app


