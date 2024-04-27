const User = require("../models/user/User");
const Stock = require("../models/stock/stock");
// const Wallet = require("../models/wallet/wallet");
const mongoose = require('mongoose');

exports.buyStock = async (req, res, next) => {
    try {
      const { userId, quantity, price, name, symbol } = req.body;
  
      // Find the user by userId
      const user = await User.findById(userId).populate('wallet');
  
      if (!user) {
        return res.status(404).json({ error: 'User not found' });
      }
  
      // Destructure wallet from user
      const { wallet } = user;
  
      const totalCost = quantity * price;
  
      if (wallet.balance < totalCost) {
        return res.status(400).json({ error: 'Insufficient balance' });
      }

    // Deduct totalCost from wallet balance
    wallet.balance -= totalCost;

    // Update investedAmount in wallet
    wallet.investedAmount += totalCost;

    await wallet.save();
  
      // Create a new stock object with name and symbol
      const stock = new Stock({
        name,
        symbol
      });
  
      // Save the stock to database
      await stock.save();
  
      // Push the stock object with quantity and buyPrice to user's stocks arra
      user.stocks.push({
        stock: stock._id,
        quantity,
        buyPrice: price,
      });
  
      // Save the user with updated stocks array
      await user.save();
  
      res.status(200).json({ message: 'Stock purchased successfully' });
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: 'Internal server error' });
    }
  };
  
  exports.getUserStocks = async (req, res, next) => {
    try {
        const { userId } = req.params;

        // Check if userId is a valid ObjectId
        if (!mongoose.isValidObjectId(userId)) {
            return res.status(400).json({ error: 'Invalid user ID' });
        }

        // Find the user by ID and populate the 'stocks.stock' field
        const user = await User.findById(userId).populate('stocks.stock');

        if (!user) {
            return res.status(404).json({ error: 'User not found' });
        }

        // Extract the populated stocks from the user object
        const userStocks = user.stocks;

        res.status(200).json({ success: true, data: userStocks });
    } catch (error) {
        console.log(error);
        res.status(500).json({ message: 'Internal Server Error' });
    }
};

exports.sellStock = async (req, res, next) => {
    try {
        const { userId, stockId, quantity, sellPrice } = req.body;

        // Find the user by userId
        const user = await User.findById(userId).populate('stocks.stock').populate('wallet');

        if (!user) {
            return res.status(404).json({ error: 'User not found' });
        }

        // Find the stock in user's portfolio
        const stockIndex = user.stocks.findIndex(stock => stock.stock._id.toString() === stockId);

        if (stockIndex === -1) {
            return res.status(404).json({ error: 'Stock not found in user\'s portfolio' });
        }

        const stockToSell = user.stocks[stockIndex];
        const { quantity: userStockQuantity, buyPrice } = stockToSell;

        // Ensure the user has enough quantity to sell
        if (userStockQuantity < quantity) {
            return res.status(400).json({ error: 'Insufficient quantity to sell' });
        }

        // Calculate total selling price
        const totalSellingPrice = quantity * sellPrice;

        // Update the user's wallet balance
        user.wallet.balance += totalSellingPrice;

        // Update the invested amount in the wallet
        user.wallet.investedAmount = Math.max(user.wallet.investedAmount - totalSellingPrice, 0);

        await user.wallet.save();

        // Remove the sold stocks from the user's portfolio
        if (userStockQuantity === quantity) {
            console.log("enter")
            // If all stocks are sold, remove the stock entry from the user's portfolio
            user.stocks.splice(stockIndex, 1);
            // await user.stocks.save();
        } else {
            // Update the remaining quantity
            stockToSell.quantity -= quantity;
        }
        
        // Save the updated user data
        await stockToSell.save();
        await user.save();

        res.status(200).json({ message: 'Stock sold successfully' });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal server error' });
    }
};

