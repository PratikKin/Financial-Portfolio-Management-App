const express = require("express");
const router = express.Router();

const userController = require('../controller/User');

// /user/signup
router.post('/signup',userController.getUser)

//  /user/login
router.post('/login',userController.logInUser)

// /user/verify
router.get('/verify/:userId/:uniqueString', userController.getVerify)

// /user/verrified
router.get('/verified', userController.verified)

// /user/requestPasswordReset
router.post('/requestPasswordReset', userController.getPasswordReset)

// /user/resetPassword
router.post('/PasswordReset', userController.getNewPassword)
module.exports = router;