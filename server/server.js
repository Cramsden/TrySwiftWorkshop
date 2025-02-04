var express = require('express');
var _ = require('underscore');
var linq = require('linq');
var fs = require ('fs');

const app = express()

app.get('/', function (req, res) {
  res.send('Welcome!');
});

app.get('/providers', function (req, res) {
  res.writeHead(200, { 'Content-Type': 'application/json' });
  fs.readFile(__dirname + '/data/providers.json', function (err, data) {
    if (err) {
      throw err
    }
    res.write(data.toString())
    res.end();
  });
});

app.get('/labs', function (req, res) {
  res.writeHead(200, { 'Content-Type': 'application/json' });
  fs.readFile(__dirname + '/data/labs.json', function (err, data) {
    if (err) {
      throw err
    }
    res.write(data.toString())
    res.end();
  });
});

app.get('/offices', function (req, res) {
  res.writeHead(200, { 'Content-Type': 'application/json' });
  fs.readFile(__dirname + '/data/offices.json', function (err, data) {
    if (err) {
      throw err
    }
    res.write(data.toString())
    res.end();
  });
});

app.get('/riskScores', function (req, res) {
  res.writeHead(200, { 'Content-Type': 'application/json' });
  fs.readFile(__dirname + '/data/risk_scores.json', function (err, data) {
    if (err) {
      throw err
    }
    res.write(data.toString())
    res.end();
  });
});

app.listen(8000);
