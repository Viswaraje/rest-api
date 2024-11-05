// app.js
const express = require("express");
const app = express();
const port = 3000;

app.get("/status", (req, res) => {
  res.json({ message: "API is up and running!" });
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
