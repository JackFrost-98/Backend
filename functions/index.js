const functions = require('firebase-functions');
const express = require("express");
const db = require("./api/database");

const app = express();

app.get("/newuser/:name", async (req, res) => {
    const name = req.params.name;
    const user = { name: name };
    const result = await db.create("users", user);
    user.id = result.id;
    return res.json(user);
  });
  
  app.get("/deleteuser/:id", async (req, res) => {
    const userId = req.params.id;
    const result = await db.delete("users", userId);
    console.log(result);
    return res.json(userId);
  });
  
  exports.api = functions.https.onRequest(app);
  
  // To handle "Function Timeout" exception
  exports.functionsTimeOut = functions.runWith({
    timeoutSeconds: 300,
  });