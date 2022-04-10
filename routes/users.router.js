const express =require('express')
const { GetUsers, AddUsers, UpdateUsers, DeleteUsers, GetOneUser } = require('../controllers/controllers.users')
const router=express.Router()

router.route('/users').get(GetUsers).post(AddUsers)
router.route('/users/:id').put(UpdateUsers).delete(DeleteUsers).get(GetOneUser)

module.exports=router