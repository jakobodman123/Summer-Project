var express = require('express');
var cors = require('cors');
const axious = require('axios');
const { default: axios } = require('axios');
const { response } = require('express');



const app = express();

app.use(cors());

const API_KEY = "RGAPI-ee0c0377-4dc2-49cb-88e4-2cd1ce6cb68d";
const server = "europe";



function getPlayerData(playerName) {
    const server1 = "euw1";
    return axios.get("https://euw1.api.riotgames.com" + "/lol/summoner/v4/summoners/by-name/" + playerName + "?api_key=" + API_KEY)
    .then(response => {
        console.log(response.data);
        return response.data.puuid
    }).catch(err => err);
}

app.get('/pastGames', async (req, res) => {
    const playerName = req.query.summoner;
    
    var PUUID = await getPlayerData(playerName);
    //const PUUID = playerData.puuid;
    const start = 0;
    const count = 10;
    
    const API_CALL = "https://europe.api.riotgames.com/lol/match/v5/matches/by-puuid/" + PUUID + "/ids?type=ranked&start=" + start + "&count=" + count + "&api_key=" + API_KEY;

    const gameIDS = await axios.get(API_CALL).then(response => response.data).catch(err => err);
    console.log(gameIDS);

    var matchDataArray = [];

    for(var i = 0; i < gameIDS.length; i++) {
        const matchID = gameIDS[i];
        const matchData = await axios.get("https://europe.api.riotgames.com" + "/lol/match/v5/matches/" + matchID + "?api_key=" + API_KEY)
        .then(response => response.data)
        .catch(err => err)
        matchDataArray.push(matchData);
    }

    res.json(matchDataArray);

});

app.get('/getRanked', async (req, res) => { 
    const summonerID = req.query.summonerid;

const API_CALL = "https://euw1.api.riotgames.com/lol/league/v4/entries/by-summoner/" + summonerID  + "?api_key=" + API_KEY;
const rankedQs = await axios.get(API_CALL).then(response => response.data).catch(err => err);
//var rankedArray = [];
//rankedArray.push(rankedQs[0])

res.json(rankedQs);

});


app.get('/getChallenges', async (req, res) => { 
    const PUUID = req.query.puuid;

const API_CALL = "https://euw1.api.riotgames.com/lol/challenges/v1/player-data/" + PUUID  + "?api_key=" + API_KEY;
const challenges = await axios.get(API_CALL).then(response => response.data).catch(err => err);

console.log(response.data);


res.json(challenges);

});

app.get('/getSummoner', async (req, res) => { 
    const playerName1 = req.query.summoner;

const API_CALL = "https://euw1.api.riotgames.com/lol/summoner/v4/summoners/by-name/" + playerName1 + "?api_key=" + API_KEY;
const summonerJson = await axios.get(API_CALL).then(response => response.data).catch(err => err);
//var rankedArray = [];
console.log(response.data);
//rankedArray.push(rankedQs[0])

res.json(summonerJson);

});

app.get('/getMasteries', async (req, res) => { 
    const summonerID = req.query.summonerid;

const API_CALL = "https://euw1.api.riotgames.com/lol/champion-mastery/v4/champion-masteries/by-summoner/" + summonerID  + "?api_key=" + API_KEY;
const summonerJson = await axios.get(API_CALL).then(response => response.data).catch(err => err);
//var rankedArray = [];
console.log(response.data);
//rankedArray.push(rankedQs[0])

res.json(summonerJson);

});

app.listen(4000, function () {
    console.log("Server started on port 4000")
} ); //localhost:4000

