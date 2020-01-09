var express = require('express'),
    app = express(),
    port = process.env.PORT || 3000;

const cors = require('cors');
const asociar = require('./asociar');

const http = require('http').createServer(app.use(cors()));
const io = require('socket.io')(http);

asociar.implementar();

io.on('connection', function(socket){
	console.log('Nueva Conexion');

	socket.on('nuevo_paso', function(id_mercancia){
		console.log('Nuevo paso recibido: ', id_mercancia);
		io.emit('nuevo_detalle', id_mercancia);
	});
});


app.use('/api/core', require('./api/routes/routes'));

http.listen(port, function(){
	console.log('listening on *: ' + port);
});