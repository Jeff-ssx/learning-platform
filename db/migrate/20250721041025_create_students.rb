class CreateStudents < ActiveRecord::Migration[7.0]
  def up
    create_table :students do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.references :school, null: false, foreign_key: true
      t.timestamps
    end

    add_index :students, :email, unique: true
  end

  def down
    drop_table :students
  end
end
