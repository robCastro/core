/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('mercancia', {
		id_mercancia: {
			type: DataTypes.INTEGER,
			allowNull: false,
			primaryKey: true,
			autoIncrement: true
		},
		id_tipo_mercancia: {
			type: DataTypes.INTEGER,
			allowNull: false,
			references: {
				model: 'tipo_mercancia',
				key: 'id_tipo_mercancia'
			}
		},
		id_envia: {
			type: DataTypes.INTEGER,
			allowNull: false,
			references: {
				model: 'responsable',
				key: 'id_responsable'
			}
		},
		id_recibe: {
			type: DataTypes.INTEGER,
			allowNull: false,
			references: {
				model: 'responsable',
				key: 'id_responsable'
			}
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
