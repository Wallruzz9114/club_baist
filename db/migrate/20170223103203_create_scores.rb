class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
      t.integer :total
      t.integer :course_rating
      t.integer :handicap
      t.integer :reservation_id
      t.integer :user_id

      t.timestamps
    end
  end
end
