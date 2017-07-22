var express = require("express");
var app = express();
var path = require('path');

app.use(express.static(path.join(__dirname, 'public')));

// app.get('/', (req, res) => {
//     res.sendFile(__dirname + '/public/index.html');
// });

app.listen(8080, function(){
    console.log('the server is listening on 8080')
});

// app.listen(80, function(){
//     console.log('the server is listening on 80')
// });
