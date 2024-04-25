const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const FDSchema = new Schema({
  bankName: {
    type: String,
    require: true,
  },
  fdType:{
    type:String,
    require:true
  },
  fdName:{
    type:String,
    require:true
  },
  amountdeposited: {
    type: Number,
    require: true,
  },
  IR: {
    type: Number,
    require: true,
  },
  investedDate: {
    type: Date,
    require: true,
  },
  maturityDate: {
    type: Date,
    require: true,
  },
  totalAmount: {
    type: Number,
    require: true,
  },
  notes: {
    type: String,
  },
  // user: {
  //   type: mongoose.Schema.Types.ObjectId,
  //   ref: "User",
  //   required: true,
  // },
  createdAt: {
    type: Date,
    default: () => Date.now(),
    immutable: true,
  },
  updatedAt: Date,
});

const FD = mongoose.model("FD", FDSchema);

module.exports = FD;
