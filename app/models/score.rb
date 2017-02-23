class Score < ApplicationRecord
  before_save :set_handicap
  belongs_to :user
  belongs_to :reservation

  validates :total, presence: true, numericality: { only_integer: true, greater_than: 75, less_than: 175 }
  validates :course_rating, presence: true, numericality: { only_integer: true, greater_than: 67, less_than: 75 }

  private

  def set_handicap
    handicap_value = self.total - self.course_rating
    self.assign_attributes(handicap: handicap_value)
  end
end
