class CreateLicenses < ActiveRecord::Migration[7.0]
  def up
    create_table :licenses do |t|
      t.string     :code, null: false, unique: true
      t.references :term, foreign_key: true
      t.references :student, foreign_key: true
      t.string     :status, null: false, default: 'unused'
      t.timestamps
    end

    add_index :licenses, :code
  end

  def down
    remove_index :licenses, :code

    drop_table :licenses
  end
end
