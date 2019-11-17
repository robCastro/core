/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('marca', {
		id_marca: {
			type: DataTypes.INTEGER,
			allowNull: false,
			primaryKey: true,
			autoIncrement: true
		},
		nombre_marca: {
			type: DataTypes.STRING,
			allowNull: false
		},
		activo_marca: {
			type: DataTypes.BOOLEAN,
			allowNull: false
		}
	}, {
		tableName: 'marca',
		timestamps: false
	});
};
