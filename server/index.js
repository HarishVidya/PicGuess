const express = require("express");
var http = require("http");
const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);
const mongoose = require("mongoose");
const Party = require('/models/Party');
var io = require("socket.io")(server);


app.use(express.json())

io.on('connection', (socket) => {
    console.log('connected');

    socket.on('create-game', async ({ username, name, partySize, maxRounds }) => {
        try {
            const existingRoom = await Party.findOne({ name });
            if (existingRoom) {
                socket.emit('notCorrectGame', "Room with that name already exists!");
                return;
            }
            let party = new Party();
            party.name = name;
            party.partySize = partySize;
            party.maxRounds = maxRounds;

            let player = {
                socketID: socket.id,
                username,
                isPartyLeader: true,
            }

            party.players.push(player);
            party = await party.save();
            socket.join(name);
            io.to(name).emit('updateParty', party);
        } catch (err) {
            console.log(err);
        }
    });

});