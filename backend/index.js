//importing files
require('./config/db')
const express = require("express");
const app = express();

// CORS or Cross-Origin Resource Sharing 
// a mechanism by which a front-end client can make requests for resources to an external back-end server
const cors = require("cors");
app.use(cors());

// Body Parser is a middleware of Node JS used to handle HTTP POST request
// it help to pass body in request

const bodyParser = require('body-parser');
app.use(bodyParser.json());

const UserRouter = require('./routes/User')

app.use('/user', UserRouter);


const port = process.env.PORT || 5000;
app.listen(port, ()=>{
    console.log(`server running on port ${port}`)
})
