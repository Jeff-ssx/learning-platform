class CreateCourses < ActiveRecord::Migration[7.0]
  def up
    create_table :courses do |t|
      t.string :name, null: false
      t.references :term, null: false, foreign_key: true
      t.timestamps
    end

    add_index :courses, [:term_id, :name], unique: true
  end

  def down
    remove_index :courses, [:term_id, :name]
    drop_table :courses
  end
end
