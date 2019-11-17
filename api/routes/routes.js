'use strict';

const express = require('express');
const coreController = require('../controllers/coreController');
const router = express.Router();

router.get('/pais', coreController.get_paises);


module.exports = router;
