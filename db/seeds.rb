def rand_time(from, to = Time.now)
  Time.at(rand_in_range(from.to_f, to.to_f))
end

def rand_in_range(from, to)
  rand * (to - from) + from
end

airports = { 'ATL' => 'Atlanta',
             'PEK' => 'Beijing',
             'DXB' => 'Dubai',
             'ORD' => 'Chicago',
             'HND' => 'Tokyo',
             'LHR' => 'London',
             'LAX' => 'Los Angeles' }

airports.each { |code, location| Airport.create!(code: code, location: location) }

Flight.create!(from_airport_id: 1,
               to_airport_id: 2,
               date_time: Date.tomorrow,
               duration: 300)

49.times do
  from_airport_id = Random.rand(1..Airport.count)
  to_airport_id = Random.rand(1..Airport.count)
  date_time = rand_time(3.months.ago, 3.months.from_now)
  duration = Random.rand(60..720)
  Flight.create!(from_airport_id: from_airport_id,
                 to_airport_id: to_airport_id,
                 date_time: date_time,
                 duration: duration)
end
