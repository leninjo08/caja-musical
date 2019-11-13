class CreateInstruments < ActiveRecord::Migration[5.1]
  def change
    create_table :instruments do |t|
      t.string :marca
      t.string :modelo
      t.text :descripcion
      t.string :condicion
      t.string :color
      t.string :titulo
      t.decimal :precio, precision: 5, scale: 2, default: 0

      t.timestamps
    end
  end
end
