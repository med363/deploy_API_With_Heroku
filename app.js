var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
//*import package mongoose w package env
var mongoose = require('mongoose');
require('dotenv').config()

const usersRouter = require("./routes/users.router")


var app = express();

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
//collection of route
app.use("/api",usersRouter)
// connection database
mongoose.connect(process.env.Mongo_url, { useNewUrlParser: true, useUnifiedTopology: true }).then(() => {
    console.log('connection succesfully')
}).catch(err => {
    console.log('failed connection', err)
})

module.exports = app;
