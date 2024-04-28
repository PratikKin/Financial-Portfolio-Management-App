const express = require("express");
const router = express.Router()

const StockController = require("../controller/Stock");

router.post('/buy', StockController.buyStock);
router.post('/sell', StockController.sellStock);
router.get("/:userId/stocks",StockController.getUserStocks)

module.exports = router;