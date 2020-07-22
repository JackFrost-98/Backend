const functions = require('firebase-functions');
const db = require("./api/database");
const express = require("express");
const app = express();

app.get("/users/:id", async(req, res, next) => {
  try {
      const result = await db.get("users",req.params.id);
      if (!result) return res.sendStatus(404);
      return res.json(result);
  } catch (e) {
      return next(e);
  }
});

app.post("/users/:name", async (req, res) => {
  const name = req.params.name;
  const user = { name: name };
  const result = await db.create("users",user);
  user.id = result.id;
  return res.json(user);
});

app.delete("/users/:id", async (req, res) => {
  const userId = req.params.id;
  const result = await db.delete("users",userId);
  console.log(result);
  return res.json(userId);
});

app.put("/users/:id", async (req, res, next) => {
  try {
    const updateResult = await db.set("users",req.params.id, req.body);
    if (!updateResult) return res.sendStatus(404);

    const result = await db.get("users",req.params.id);
    console.log(result);
    return res.json(result);
  } catch (e){
    return next(e);
  }
});

app.patch("/users/:id", async (req, res, next) => {
  try {
    const id = req.params.id;
    const data = req.body;

    const doc = await db.get("users",id);
    if (!doc) return res.sendStatus(404);

    Object.keys(data).forEach((key) => (doc[key] = data[key]));

    const updateResult = await db.set("users",id, doc);
    if (!updateResult) return res.sendStatus(404);

    return res.json(doc);
  } catch (e){
    return next(e);
  }
});   

exports.api = functions.https.onRequest(app);

// To handle "Function Timeout" exception
exports.functionsTimeOut = functions.runWith({
  timeoutSeconds: 300,
});
