class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name_first
      t.string :name_last
      t.integer :teacher_id
      t.integer :current_lesson
      t.integer :current_part
      t.timestamps null: false
    end
  end
end
