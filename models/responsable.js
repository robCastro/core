/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('responsable', {
		id_responsable: {
			type: DataTypes.INTEGER,
			allowNull: false,
			primaryKey: true,
			autoIncrement: true
		},
		id_pais: {
			type: DataTypes.INTEGER,
			allowNull: false,
			references: {
				model: 'pais',
				key: 'id_pais'
			}
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
