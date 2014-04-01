let express = require 'express'
let http    = require 'http'

let app     = module.exports := express()

app.set 'port', 80
app.set 'views', "$__dirname/views"
app.set 'view engine', 'jade'

app.use express.static "$__dirname/public"
app.use express.json()
app.use express.urlencoded()
app.use express.methodOverride()
app.use app.router

app.use express.errorHandler()

app.get '/', # (req,res) res.render 'index'

http.createServer(app).listen app.get 'port'