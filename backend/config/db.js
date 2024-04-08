// Uses to load environment variables from a .env file into process.env.
require('dotenv').config();

// It is Object-Document Mapping (ODM) library for MongoDB and Node.js.
//Uses to define database schema and models 
const mongoose = require("mongoose");

mongoose.connect(process.env.MONGODB_URI,{
    // useNewUrlParser: Set to true to use the new MongoDB connection string parser. 
    //useUnifiedTopology: Set to true to use the new Server Discovery and Monitoring engine.
    useNewUrlParser: true, 
    useUnifiedTopology: true 
}).then(()=>{
    console.log("DB connected Succesfully")
}).catch((err)=>{console.log(err)});

