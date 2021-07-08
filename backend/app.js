const path = require('path');
const express = require('express');
const app = express();
const http = require('http').createServer(app);
const cors = require("cors");
const bodyParser = require('body-parser');

require('./database/connection');

const router = express.Router()
const io = require("socket.io")(http)

const userRoutes = require('./routes/user.route');
const experianceRoutes = require('./routes/experiance.route');

app.use(cors());

app.use(bodyParser.urlencoded({
  extended: false
}));

app.use(bodyParser.json()); // to give Express the ability to read JSON payloads from the HTTP request body

app.use(express.json());

//router
app.use(userRoutes);
app.use(experianceRoutes);

var clients = {};

io.on("connection", (socket) => {
    console.log("Socket connected")
    console.log(socket.id, " has joined ")

    //listen on signin event
    socket.on("signin", (id) => {
     console.log("userid " + id);
     clients[id] = socket;
    })

    //listen on message event
    socket.on("message", (msg) => {
        console.log(msg);
        let targetId = msg.targetId;
        let sourceId = msg.sourceId;
        if(clients[targetId]) clients[targetId].emit("message", msg);
    })

     socket.on("image", (msg) => {
            console.log(msg);
            let targetId = msg.targetId;
            let sourceId = msg.sourceId;
            if(clients[targetId]) clients[targetId].emit("image", msg);
        })
})


// start server
const port = '1000';
app.set('port',port);


http.listen(1000, '192.168.43.25');

app.use(function (err, req, res, next) {
  console.error(err.message);
  if (!err.statusCode) err.statusCode = 500;
  res.status(err.statusCode).send(err.message);
});

