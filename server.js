var express = require('express'),
    app = express(),
    port = process.env.PORT || 3000;

const cors = require('cors');
const asociar = require('./asociar');

asociar.implementar();

app.listen(port);
app.use(cors());

app.use('/api/core', require('./api/routes/routes'));

console.log('RESTful API server started on: ' + port);

