const express = require("express");
var http = require("http");
const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);
const mongoose = require("mongoose");
const Party = require('/models/Party');
var io = require("socket.io")(server);


app.use(express.json())

