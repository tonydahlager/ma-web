
/*!
 * Module dependencies
 */

var mongoose = require('mongoose')
var Schema = mongoose.Schema

/**
 * Card schema
 */

var CardSchema = new Schema({
  title: { type: String, default: '' }
})


/**
 * Methods
 */

CardSchema.method({

})

/**
 * Statics
 */

CardSchema.static({

})

/**
 * Register
 */

mongoose.model('Card', CardSchema)
