/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('mercancia', {
		id_mercancia: {
			type: DataTypes.INTEGER,
			allowNull: false,
			defaultValue: 'nextval(mercancia_id_mercancia_seq::regclass)',
			primaryKey: true
		},
		id_tipo_mercancia: {
			type: DataTypes.INTEGER,
			allowNull: false,
			primaryKey: true
		},
		id_envia: {
			type: DataTypes.INTEGER,
			allowNull: false,
			primaryKey: true
		},
		id_recibe: {
			type: DataTypes.INTEGER,
			allowNull: false,
			primaryKey: true
		},
		descripcion_mercancia: {
			type: DataTypes.STRING,
			allowNull: false
		},
		cantidad_mercancia: {
			type: DataTypes.INTEGER,
			allowNull: false
		},
		valor_mercancia: {
			type: DataTypes.DOUBLE,
			allowNull: false
		},
		seguro_mercancia: {
			type: DataTypes.DOUBLE,
			allowNull: false
		},
		flete_mercancia: {
			type: DataTypes.DOUBLE,
			allowNull: false
		}
	}, {
		tableName: 'mercancia',
		timestamps: false
	});
};
