const express = require("express");
const db = require("./config/db")
const bodyParser = require("body-parser");
const loginRoute = require("./routes/loginroutes");
const bookRoute = require("./routes/bookRoutes");


const app = express();
const port = 3000;

app.use(bodyParser.json())
app.use(loginRoute);
app.use(bookRoute);

app.listen(port, () => {
    console.log("Server Connected");
});
