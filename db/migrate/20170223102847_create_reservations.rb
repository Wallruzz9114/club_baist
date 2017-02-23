class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.string :first_guest_name
      t.string :second_guest_name
      t.string :third_guest_name
      t.integer :carts
      t.datetime :date_and_time
      t.integer :user_id

      t.timestamps
    end
  end
end
