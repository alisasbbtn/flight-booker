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

airport_pairs = (1..Airport.count).to_a.combination(2).to_a
dates = (Date.today..Date.today+30).map(&:to_s)

airport_pairs.each do |pair|
  from_airport_id = pair.first
  to_airport_id = pair.last
  dates.each do |date|
    date_time = date.to_datetime + Time.parse("#{Random.rand(0..23)}:#{Random.rand(0..59)}").seconds_since_midnight.seconds
  duration = Random.rand(60..720)
  Flight.create!(from_airport_id: from_airport_id,
                 to_airport_id: to_airport_id,
                 date_time: date_time,
                 duration: duration)
  end
end
