/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('transporte', {
		id_transporte: {
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
		id_marca: {
			type: DataTypes.INTEGER,
			allowNull: false,
			references: {
				model: 'marca',
				key: 'id_marca'
			}
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
