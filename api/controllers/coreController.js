'use strict';

const models = require('../../models/index');

const Pais = models.pais;

exports.get_paises = function(req, res) {
  Pais.findAll()
    .then(paises => {
	res.status(200).json(paises);
    })
    .catch(err => {
	console.log('Error: ' + err);
	res.status(500).json({ msg: "Error al mostrar contenido" });
    });
};
