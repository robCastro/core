'use strict';
const models = require('../../models/index');
const request = require('request');
const rp = require('request-promise-native');
const fetch = require('node-fetch');

const Mercancia = models.mercancia;
const Responsable = models.responsable;
const Pais = models.pais;
const TipoMercancia = models.tipo_mercancia;

exports.get_mercancia = function(req, res){
	if(isNaN(parseInt(req.params.id_mercancia))){
		res.status(400).json({ msg: 'Utilizar parametros numericos'});
		return;
	}
	Mercancia.findOne({
			include:[
				{
					model: Responsable,
					as: 'envia',
					include:[
						{
							model: Pais,
							as: 'pais'
						}
					]
				},
				{
					model: Responsable,
					as: 'recibe',
					include:[
						{
							model: Pais,
							as: 'pais'
						}
					]
				},
				{ model: TipoMercancia }
			],
			where: {id_mercancia : req.params.id_mercancia}
		})
		.then(mercancia => {
			if(mercancia === null){
				res.status(404).json({ msg: 'Mercancia no existe'});
				return;
			}
			res.status(200).json(mercancia);
		}).catch(err => {
			console.log(err);
			res.status(500).json(err);
		}
	);
}

exports.get_mercancia_detalles = async function(req, res){
	if(isNaN(parseInt(req.params.id_mercancia))){
		res.status(400).json({ msg: 'Utilizar parametros numericos'});
		return;
	}
	let detalles = [];
	let errores = [];
	try {
		let detallePromiseA = await fetch(`http://localhost:3001/api/plugina/pasa/${req.params.id_mercancia}/detalle`);
		let detalleA = await detallePromiseA.json();
		detalles = detalles.concat(detalleA);
	}catch(error){
		console.log(error);
		errores.push("No se pudo contactar a Plugin A");
	}
	try {
		let detallePromiseB = await fetch(`http://localhost:3002/api/pluginb/pasa/${req.params.id_mercancia}/detalle`);
		let detalleB = await detallePromiseB.json();
		detalles = detalles.concat(detalleB);
	}catch(errorB){
		console.log(errorB);
		errores.push("No se pudo contactar a Plugin B");
	}
	let respuesta = new Object();
	respuesta.detalles = detalles;
	respuesta.errores = errores;
	res.status(200).json(respuesta);
	/*request(`http://localhost:3001/api/plugina/pasa/${req.params.id_mercancia}/detalle`, function(errorA, resPlugA, bodyPlugA){
		if (errorA){
			errores.push("No se pudo contactar a plugin A");
		}
		else{
			if(resPlugA.statusCode === 200){
				console.log(JSON.parse(bodyPlugA));
				detalles = detalles.concat(JSON.parse(bodyPlugA));
			}
		}
		request(`http://localhost:3002/api/pluginb/pasa/${req.params.id_mercancia}/detalle`, function(errorB, resPlugB, bodyPlugB){
			if(errorB){
				errores.push("No se pudo contactar a plugin B");
			}
			else{
				if(resPlugB.statusCode === 200){
					console.log(JSON.parse(bodyPlugB));
					detalles = detalles.concat(JSON.parse(bodyPlugB));
					let respuesta = new Object();
					respuesta.detalles = detalles;
					respuesta.errores = errores;
					res.status(200).json(respuesta);
				}
			}
		});
	});
	*/
}