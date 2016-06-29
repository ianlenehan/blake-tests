class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :lesson_number
      t.integer :parts
      t.timestamps null: false
    end
  end
end
