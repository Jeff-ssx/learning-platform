class CreateTerms < ActiveRecord::Migration[7.0]
  def up
    create_table :terms do |t|
      t.string :name, null: false
      t.references :school, null: false, foreign_key: true
      t.timestamps
    end

    add_index :terms, [:school_id, :name], unique: true
  end

  def down
    remove_index :terms, [:school_id, :name]
    drop_table :terms
  end
end
