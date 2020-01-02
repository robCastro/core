/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('tipo_mercancia', {
		id_tipo_mercancia: {
			type: DataTypes.INTEGER,
			allowNull: false,
			defaultValue: 'nextval(tipo_mercancia_id_tipo_mercancia_seq::regclass)',
			primaryKey: true
		},
		tip_id_tipo_mercancia: {
			type: DataTypes.INTEGER,
			allowNull: true,
			primaryKey: true
		},
		descripcio_tipo_mercancia: {
			type: DataTypes.STRING,
			allowNull: false
		},
		activo_tipo_mercancia: {
			type: DataTypes.BOOLEAN,
			allowNull: false
		}
	}, {
		tableName: 'tipo_mercancia',
		timestamps: false
	});
};
