# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2025_07_28_070620) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "course_enrollments", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_enrollments_on_course_id"
    t.index ["student_id", "course_id"], name: "index_course_enrollments_on_student_id_and_course_id", unique: true
    t.index ["student_id"], name: "index_course_enrollments_on_student_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "term_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["term_id", "name"], name: "index_courses_on_term_id_and_name", unique: true
    t.index ["term_id"], name: "index_courses_on_term_id"
  end

  create_table "licenses", force: :cascade do |t|
    t.string "code", null: false
    t.bigint "term_id"
    t.bigint "student_id"
    t.string "status", default: "unused", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_licenses_on_code"
    t.index ["student_id"], name: "index_licenses_on_student_id"
    t.index ["term_id"], name: "index_licenses_on_term_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.bigint "school_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id", "email"], name: "index_students_on_school_id_and_email", unique: true
    t.index ["school_id"], name: "index_students_on_school_id"
  end

  create_table "term_accesses", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "term_id", null: false
    t.integer "payment_method", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_method"], name: "index_term_accesses_on_payment_method"
    t.index ["student_id", "term_id"], name: "index_term_accesses_on_student_id_and_term_id", unique: true
    t.index ["student_id"], name: "index_term_accesses_on_student_id"
    t.index ["term_id"], name: "index_term_accesses_on_term_id"
  end

  create_table "terms", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "school_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id", "name"], name: "index_terms_on_school_id_and_name", unique: true
    t.index ["school_id"], name: "index_terms_on_school_id"
  end

  add_foreign_key "course_enrollments", "courses"
  add_foreign_key "course_enrollments", "students"
  add_foreign_key "courses", "terms"
  add_foreign_key "licenses", "students"
  add_foreign_key "licenses", "terms"
  add_foreign_key "students", "schools"
  add_foreign_key "term_accesses", "students"
  add_foreign_key "term_accesses", "terms"
  add_foreign_key "terms", "schools"
end
