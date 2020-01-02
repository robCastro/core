/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('pais', {
		id_pais: {
			type: DataTypes.INTEGER,
			allowNull: false,
			defaultValue: 'nextval(pais_id_pais_seq::regclass)',
			primaryKey: true
		},
		nombre_pais: {
			type: DataTypes.STRING,
			allowNull: false
		},
		activo_pais: {
			type: DataTypes.BOOLEAN,
			allowNull: false
		}
	}, {
		tableName: 'pais',
		timestamps: false
	});
};
