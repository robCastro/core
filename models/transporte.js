/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('transporte', {
		id_transporte: {
			type: DataTypes.INTEGER,
			allowNull: false,
			defaultValue: 'nextval(transporte_id_transporte_seq::regclass)',
			primaryKey: true
		},
		id_pais: {
			type: DataTypes.INTEGER,
			allowNull: false,
			primaryKey: true
		},
		id_marca: {
			type: DataTypes.INTEGER,
			allowNull: false,
			primaryKey: true
		},
		placa_transporte: {
			type: DataTypes.STRING,
			allowNull: false
		},
		modelo_transporte: {
			type: DataTypes.STRING,
			allowNull: true
		},
		activo_transporte: {
			type: DataTypes.BOOLEAN,
			allowNull: false
		}
	}, {
		tableName: 'transporte',
		timestamps: false
	});
};
