const express =require('express')
const { GetUsers, AddUsers, UpdateUsers, DeleteUsers, GetOneUser,GetMessage } = require('../controllers/controllers.users')
const router=express.Router()

router.route('/').get(GetMessage)
router.route('/users').get(GetUsers).post(AddUsers)
//router.route('/user')
router.route('/users/:id').put(UpdateUsers).delete(DeleteUsers).get(GetOneUser)

module.exports=router
