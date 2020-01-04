'use strict';

const express = require('express');
const coreController = require('../controllers/coreController');
const mercanciaController = require('../controllers/mercanciaController');
const transporteController = require('../controllers/transporteController');

const router = express.Router();


router.get('/pais', coreController.get_paises);


router.get('/mercancia/:id_mercancia', mercanciaController.get_mercancia);
router.get('/mercancia/:id_mercancia/detalles', mercanciaController.get_mercancia_detalles);


router.get('/transporte', transporteController.get_transportes);


module.exports = router;
