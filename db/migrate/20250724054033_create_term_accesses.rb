class CreateTermAccesses < ActiveRecord::Migration[7.0]
  def up
    create_table :term_accesses do |t|
      t.references :student, null: false, foreign_key: true
      t.references :term, null: false, foreign_key: true

      t.integer :payment_method, null: false

      t.timestamps
    end

    add_index :term_accesses, [:student_id, :term_id], unique: true
    add_index :term_accesses, :payment_method
  end

  def down
    remove_index :term_accesses, [:course_id, :term_id]
    remove_index :term_accesses, :payment_method

    drop_table :term_accesses
  end
end
