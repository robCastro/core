/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('tipo_mercancia', {
		id_tipo_mercancia: {
			type: DataTypes.INTEGER,
			allowNull: false,
			primaryKey: true,
			autoIncrement: true
		},
		tip_id_tipo_mercancia: {
			type: DataTypes.INTEGER,
			allowNull: true,
			references: {
				model: 'tipo_mercancia',
				key: 'id_tipo_mercancia'
			}
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
