class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.integer :student_id
      t.integer :lesson_id
      t.integer :part
      t.integer :mark
      t.timestamps null: false
    end
  end
end
