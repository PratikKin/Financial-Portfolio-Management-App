const express = require("express");
const router = express.Router();
const { getUserWallet} = require("../controller/wallet");


router.get("/:userId/wallet", getUserWallet);

module.exports = router;    