const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const StockSchema = new Schema({
    symbol:{
        type:String,
        require:true,
    },
    name:{
        type:String,
        require:true
    },
    createdAt:{
        type:Date,
        default:()=>Date.now(),
        immutable:true,
    },
    updateAt:Date,
})

const Stock = mongoose.model("Stock", StockSchema);

module.exports = Stock;