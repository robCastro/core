/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('responsable', {
		id_responsable: {
			type: DataTypes.INTEGER,
			allowNull: false,
			defaultValue: 'nextval(responsable_id_responsable_seq::regclass)',
			primaryKey: true
		},
		id_pais: {
			type: DataTypes.INTEGER,
			allowNull: false,
			primaryKey: true
		},
		nombres_responsable: {
			type: DataTypes.STRING,
			allowNull: false
		},
		apellidos_responsable: {
			type: DataTypes.STRING,
			allowNull: true
		},
		fecha_nac_responsable: {
			type: DataTypes.DATEONLY,
			allowNull: true
		},
		direccion_responsable: {
			type: DataTypes.STRING,
			allowNull: true
		},
		activo_responsable: {
			type: DataTypes.BOOLEAN,
			allowNull: false
		}
	}, {
		tableName: 'responsable',
		timestamps: false
	});
};
