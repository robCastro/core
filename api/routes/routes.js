'use strict';

const express = require('express');
const coreController = require('../controllers/coreController');
const mercanciaController = require('../controllers/mercanciaController');
const router = express.Router();

router.get('/pais', coreController.get_paises);
router.get('/mercancia/:id_mercancia', mercanciaController.get_mercancia);

module.exports = router;
