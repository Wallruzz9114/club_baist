class AddDateOfBirthToMembershipApplication < ActiveRecord::Migration[5.0]
  def change
    add_column :membership_applications, :date_of_birth, :date
  end
end
