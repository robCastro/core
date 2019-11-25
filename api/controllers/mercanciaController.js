'use strict';
const models = require('../../models/index');

const Mercancia = models.mercancia;
const Responsable = models.responsable;
const Pais = models.pais;
const TipoMercancia = models.tipo_mercancia;

exports.get_mercancia = function(req, res){
	if(isNaN(parseInt(req.params.id_mercancia))){
		res.status(400).json({ msg: 'Utilizar parametros numericos'});
		return;
	}
	
	/*Mercancia.belongsTo(Responsable, {foreignKey: 'id_envia', as: 'envia'});
	Responsable.hasMany(Mercancia, {foreignKey: 'id_envia', as: 'envia'});

	Mercancia.belongsTo(Responsable, {foreignKey: 'id_recibe', as: 'recibe'});
	Responsable.hasMany(Mercancia, {foreignKey: 'id_recibe', as: 'recibe'});

	Responsable.belongsTo(Pais, {foreignKey: 'id_pais', as: 'pais'});
	Pais.hasMany(Responsable, {foreignKey: 'id_pais', as: 'pais'});

	Mercancia.belongsTo(TipoMercancia, {foreignKey: 'id_tipo_mercancia'});
	TipoMercancia.hasMany(Mercancia, {foreignKey: 'id_tipo_mercancia'});*/

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
				res.sendStatus(404);
				return;
			}
			res.status(200).json(mercancia);
		}).catch(err => {
			console.log(err);
			res.status(500).json(err);
		}
	);
}

