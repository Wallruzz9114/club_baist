class Reservation < ApplicationRecord
  belongs_to :user
  has_one :score

  validates :first_guest_name, presence: true
  validates :carts, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 5 }
  validates :date_and_time, presence: true, uniqueness: true
  validate :date_cannot_be_in_the_past
  validate :first_and_second_names
  validate :first_and_third_names
  validate :second_and_third_names
  validate :first_name_not_current_user
  validate :second_name_not_current_user
  validate :third_name_not_current_user

  private

  def date_cannot_be_in_the_past
    if date_and_time.present? && date_and_time < Date.today
      errors.add(:date_and_time, "can't be in the past")
    end
  end

  def first_and_second_names
    errors.add(:first_guest_name, "can't be used twice!") unless
      first_guest_name != second_guest_name
  end

  def first_and_third_names
    errors.add(:first_guest_name, "can't be used twice!") unless
      first_guest_name != third_guest_name
  end

  def second_and_third_names
    errors.add(:second_guest_name, "can't be used twice!") unless
      second_guest_name != third_guest_name or second_guest_name != nil
  end

  def first_name_not_current_user
    errors.add(:first_guest_name, "can't be you!!") unless
    first_guest_name != user.full_name
  end

  def second_name_not_current_user
    errors.add(:second_guest_name, "can't be you!!") unless
    second_guest_name != user.full_name
  end

  def third_name_not_current_user
    errors.add(:third_guest_name, "can't be you!!") unless
    third_guest_name != user.full_name
  end
end
