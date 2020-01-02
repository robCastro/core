/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('plugin', {
		id_plugin: {
			type: DataTypes.INTEGER,
			allowNull: false,
			primaryKey: true
		},
		url_plugin: {
			type: DataTypes.STRING,
			allowNull: false
		},
		activo_plugin: {
			type: DataTypes.BOOLEAN,
			allowNull: false
		},
		desarrollo_url_plugin: {
			type: DataTypes.BOOLEAN,
			allowNull: false
		}
	}, {
		tableName: 'plugin',
		timestamps: false
	});
};
