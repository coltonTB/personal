fs = require 'fs'
markdown = require('markdown').markdown
handlebars = require('handlebars')

process = (key, opts) ->
  fstats = fs.lstatSync "./content/#{key}"
  if fstats.isDirectory()
    files = fs.readdirSync "./content/#{key}"
    rawFiles = files.map (file) ->
      fs.readFileSync("./content/#{key}/#{file}").toString()
  else if fstats.isFile()
    rawFiles = [fs.readFileSync("./content/#{key}").toString()]
  else 
    throw new Error 'not a file or directory'

  return rawFiles.map (file) ->
    if opts.summarize
      file = file.split('\n\n')[0..2].join('\n\n')
    markdown.toHTML file


module.exports = (key, opts) ->
  result = process(key, opts || {})
  if !result.length
    return ''
  else if result.length is 1
    return result[0]
  else
    return result
