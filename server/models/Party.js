const mongoose = require('mongoose');
const { playerSchema } = require('/Player');

const partySchema = new mongoose.Schema({
    
    name: {
        required: true,
        type: String,
        unique: true,
        trim: true,
    },

    partySize: {
        required: true,
        type: Number,
        default: 4,
    },

    maxRounds: {
        required: true,
        type: Number,
    },

    currentRound: {
        required: true,
        type: Number,
        default: 1,
    },

    players: [playerSchema],
    isJoin: {
        type: Boolean,
        default: true,
    },

    turn: playerSchema,
    turnIndex: {
        type: Number,
        default: 0
    }

})

const gameModel = mongoose.model('Party', partySchema)
module.exports = gameModel

