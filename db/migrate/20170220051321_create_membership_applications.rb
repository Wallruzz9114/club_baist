class CreateMembershipApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :membership_applications do |t|
      t.string :address
      t.string :postal_code
      t.string :phone
      t.string :occupation
      t.string :company_name
      t.string :company_address
      t.string :company_postal_code
      t.string :company_phone
      t.string :membership
      t.string :first_sponsor_name
      t.string :second_sponsor_name
      t.integer :user_id

      t.timestamps
    end
  end
end
