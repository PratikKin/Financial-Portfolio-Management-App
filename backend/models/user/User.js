const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const UserSchema = new Schema({
    name:{
        type:String,
        require:true
    },
    email:{
        type:String,
        require:true,
        unique:true
    },
    password:{
        type:String,
        require:true
    },
    verified:Boolean,
    wallet:{
        type:mongoose.Schema.Types.ObjectId,
        ref:"Wallet",
    },
    fds:[{
        type:mongoose.Schema.Types.ObjectId,
        ref:"FD"
    }],
    stocks:[{
        stock:{
            type:mongoose.Schema.Types.ObjectId,
            ref:"Stock"
        },
        quantity:{
            type:Number,
            require:true
        },
        buyPrice:{
            type:Number,
            required:true
        }
    }]
})

const User = mongoose.model('User', UserSchema);

module.exports = User;