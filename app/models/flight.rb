class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: 'Airport'
  belongs_to :to_airport, class_name: 'Airport'
  has_many :bookings
  has_many :passengers, through: :bookings

  def self.avaliable_dates
    flights = all.where('date_time >= ?', Date.today).order(date_time: :asc)
    flights.map { |flight| flight.date_time.strftime('%b %d %Y') }.uniq
  end

  def self.avaliable_flights(from, to, date)
    where(from_airport_id: from,
          to_airport_id: to,
          date_time: all_day(date))
  end

  private

  def self.all_day(date)
    datetime = date.to_datetime
    datetime.beginning_of_day..datetime.end_of_day
  end
end
