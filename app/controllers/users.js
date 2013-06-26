// users.js

var mongoose = require('mongoose')
  , User = mongoose.model('User')

exports.signup = function(req, res) {
  res.render('users/signup', {
    title: 'Sign up', 
    user: new User
  })
}

exports.session = function (req, res){ }

exports.create = function (req, res) {
  var user = new User(req.body)
  user.provider = 'local',
  user.save( function(err) {
    
    // if there isn't a clean save
    if(err){
      return res.render('users/signup', {
        errors: err.errors,
        user: user,
        title: 'Sign up'
      })
    }

    // if clean save
    req.logIn(user, function(err){
      if (err) return next(err)
      return res.redirect('/')
    })
  })
}

exports.login = function (req, res) {
  res.render('users/login', {
    title: 'Login',
    message: req.flash('error')
  })
}

exports.logout = function (req, res) {
  req.logout()
  res.redirect('/login')
}


exports.show = function (req, res) {
  var user = req.profile
  console.log(req)
  res.render('users/show', {
    title: user.name,
    user: user
  })
}

exports.authCallback = function(requ, res, next) {
  res.redirect('/')
}
