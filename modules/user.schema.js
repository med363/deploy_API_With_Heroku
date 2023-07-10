//schema hetha mich nista3mlo fil methodes (controllers.users) w npointy 3ala kol champs ->req.body.

// 3ibaratan class se forme schema pour faire plusieur instance
const { Timestamp } = require('mongodb')
const mongoose = require('mongoose')
    // mongoose.Schema({

// })
const userSchema = mongoose.Schema({
        fullName: {
            type: String,
            required: true,
        },
        phone: {
            type: String,
            required: [ true, "+216"]
        },
        email: String,
        password: String,
        is_active: { type: Boolean, default: false },
        is_verified: { type: Boolean, default: false }
    }, { Timestamp: true }


)

module.exports = mongoose.model('User', userSchema)
