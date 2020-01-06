'use strict';
const models = require('../../models/index');
const request = require('request');
const fetch = require('node-fetch');

const Mercancia = models.mercancia;
const Responsable = models.responsable;
const Pais = models.pais;
const TipoMercancia = models.tipo_mercancia;
const Plugin = models.plugin;

exports.get_mercancia = function(req, res){
	if(isNaN(parseInt(req.params.id_mercancia))){
		res.status(400).json({ msg: 'Utilizar parametros numericos'});
		return;
	}
	let atributosResponsable = [
		'id_responsable',
		'nombres_responsable',
		'apellidos_responsable',
		'fecha_nac_responsable',
		'direccion_responsable'
	];
	if(req.query.privado){
		atributosResponsable = ['id_pais'];
	}
	Mercancia.findOne({
			include:[
				{
					model: Responsable,
					as: 'envia',
					attributes: atributosResponsable,
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
					attributes: atributosResponsable,
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
	Mercancia.findOne({
		where:{
			id_mercancia: parseInt(req.params.id_mercancia)
		}
	}).then(mercancia => {
		if (mercancia === null){
			res.status(404).json({msg: 'Mercancia no existe'});
		}
		else{
			Plugin.findAll({
				where:{
					activo_plugin : true,
					desarrollo_url_plugin: process.env.NODE_ENV !== 'production'
				}
			}).then(plugins => {
				let cantidad = plugins.length;
				plugins.forEach(async plugin => {
					try {
						let detallePromise = await fetch(`${plugin.url_plugin}api/plugin/pasa/${req.params.id_mercancia}/detalle`);
						let detalle = await detallePromise.json();
						detalles = detalles.concat(detalle);
					}catch(error){
						console.log('Error: ', error);
						errores.push("No se pudo contactar a Plugin " + plugin.url_plugin);
					}finally{
						cantidad--;
						if(cantidad === 0){
							let respuesta = new Object();
							respuesta.detalles = detalles;
							respuesta.errores = errores;
							res.status(200).json(respuesta);
						}
					}
				});
				
			}).catch(err => {
				console.log(err);
				res.status(500).json({msg: 'Error buscando los plugins activos'});
				return;
			});
		}
	});
}