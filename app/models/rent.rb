class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :board

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date
  # validate :rental_period_is_available
  # TODO: Add availability validator!

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  # def rental_period_is_available
  #   return unless Rent
  #       .where.not(id: )
  #       .where("rented_from < ? && ? < rented_until", rented_until, rented_from)
  #       .exist?

  #   errors.add(:base, "Car is already booked in this time period")
  # end
end
