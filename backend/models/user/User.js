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
    fds:[{
        type:mongoose.Schema.Types.ObjectId,
        ref:"FD"
    }]
})

const User = mongoose.model('User', UserSchema);

module.exports = User;