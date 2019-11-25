'use strict';
const models = require('./models/index');

const Mercancia = models.mercancia;
const Responsable = models.responsable;
const Pais = models.pais;
const TipoMercancia = models.tipo_mercancia;

exports.implementar = function(){
	Mercancia.belongsTo(Responsable, {foreignKey: 'id_envia', as: 'envia'});
	Responsable.hasMany(Mercancia, {foreignKey: 'id_envia', as: 'envia'});

	Mercancia.belongsTo(Responsable, {foreignKey: 'id_recibe', as: 'recibe'});
	Responsable.hasMany(Mercancia, {foreignKey: 'id_recibe', as: 'recibe'});

	Responsable.belongsTo(Pais, {foreignKey: 'id_pais', as: 'pais'});
	Pais.hasMany(Responsable, {foreignKey: 'id_pais', as: 'pais'});

	Mercancia.belongsTo(TipoMercancia, {foreignKey: 'id_tipo_mercancia'});
	TipoMercancia.hasMany(Mercancia, {foreignKey: 'id_tipo_mercancia'});
}