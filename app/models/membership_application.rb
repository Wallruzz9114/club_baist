class MembershipApplication < ApplicationRecord
  belongs_to :user

  canadian_postal_code = /\A[ABCEGHJKLMNPRSTVXY][0-9][ABCEGHJKLMNPRSTVWXYZ][0-9][ABCEGHJKLMNPRSTVWXYZ][0-9]\z/
  canadian_phone = /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/

  validates_uniqueness_of :user_id
  validates :address, presence: true
  validates :postal_code, presence: true, format: { with: canadian_postal_code }
  validates :phone, presence: true, format: { with: canadian_phone }
  validates :date_of_birth, presence: true
  validate :at_least_18
  validates :occupation, presence: true
  validates :company_name, presence: true
  validates :company_address, presence: true
  validates :company_postal_code, presence: true, format: { with: canadian_postal_code }
  validates :company_phone, presence: true
  validates :membership, presence: true
  validates :first_sponsor_name, presence: true
  validates :second_sponsor_name, presence: true
  validate :different_sponsors

  private

  def at_least_18
    if self.date_of_birth
      errors.add(:date_of_birth, 'must show that you are 18 years or older (< 1999).') if self.date_of_birth > 18.years.ago.to_date
    end
  end

  def different_sponsors
    errors.add(:first_sponsor_name, "can't be used twice!") unless
    first_sponsor_name != second_sponsor_name
  end
end
