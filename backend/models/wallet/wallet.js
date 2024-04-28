const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const WalletSchema = new Schema({
    balance:{
        type:Number,
        require:true,
        default:10000,
    },
    investedAmount:{
        type:Number,
        require:true,
        default:0
    }

})

const Wallet = mongoose.model("Wallet",WalletSchema)
module.exports = Wallet;