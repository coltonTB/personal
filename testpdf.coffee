fs = require 'fs'
pdf = require 'html-pdf'
cm = require './cm'

html = cm 'resume.md'
options = { filename: './businesscard.pdf', format: 'Letter' }
 
pdf.create(html, options).toFile (err, res) ->
  if (err) then return console.log(err)
  console.log(res)