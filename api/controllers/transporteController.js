'use strict';
const models = require('../../models/index');

const Transporte = models.transporte;

exports.get_transporte = function(req, res){
	Transporte.findAll().then(transportes => {
		res.status(200).json(transportes);
	}).catch(err => {
		console.log(err);
		res.status(500).json({msg: 'Error consultando los transportes'});
	});
}

exports.get_transportes = function(req, res){
	let condicion = {activo_transporte: true};
	if(req.query.placa){
		condicion.placa_transporte = req.query.placa;
	}
	console.log('Condicion: ', condicion);
	Transporte.findAll({
		where: condicion
	}).then(transporte => {
		if(transporte !== null && transporte.length > 0){
			res.status(200).json(transporte);
		}
		else{
			res.status(404).json({msg: 'Transporte no encontrado'});
		}
	})
}