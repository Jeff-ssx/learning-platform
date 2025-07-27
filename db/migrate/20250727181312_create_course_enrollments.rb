class CreateCourseEnrollments < ActiveRecord::Migration[7.0]
  def up
    create_table :course_enrollments do |t|
      t.references :student, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end

    add_index :course_enrollments, [:student_id, :course_id], unique: true
  end

  def down
    remove_index :course_enrollments, [:student_id, :course_id]

    drop_table :course_enrollments
  end
end
