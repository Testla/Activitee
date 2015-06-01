require! {express, http, path, 'cookie-parser', 'body-parser', mongoose, 'express-session', './db', './Passport/Passport', routes: './routes/index'}
logger = require 'morgan'
flash = require 'connect-flash'
favicon = require 'static-favicon'
mongoose.connect db.url

app = express!
server = http.create-server app

app.set 'views', path.join __dirname, 'views'
app.set 'view engine', 'jade'

app.use favicon!
app.use logger 'dev'
app.use bodyParser.json!
app.use bodyParser.urlencoded!
app.use cookieParser!
# app.use (new Passport).auth
app.use express.static path.join __dirname, 'public'
app.use flash!
app.locals.moment = require 'moment'

app.use '/', routes

app.use (req, res, next) ->
  err = new Error 'Not Found'
  err.status = 404
  next err

if (app.get 'env') is 'development' then app.use (err, req, res, next) ->
  res.status err.status || 500
  res.render 'error', {
    err.message
    error: err
  }

exports = module.exports = server
exports.use = -> app.use.apply app, &  

port = process.env.PORT || 5000
app.listen port
console.log 'Activitee started on port '+ port
