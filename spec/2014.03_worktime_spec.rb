require 'rspec'

def to_working_days(hours = 0.0, minutes = 0.0)
  hours/8.0 + minutes/480.0
end

sums = {}

p 'Mo. 10.03'
p 'map_jobba: 6:15 -> ' + to_working_days(6, 15).to_s
p 'amos_schulung: 2:30 -> ' + to_working_days(2, 30).to_s

puts
p 'Di. 11.03'
p 'map_jobba: 7:55 -> ' + to_working_days(7, 55).to_s

puts
p 'Mi. 12.03'
p 'map_jobba: 2:35 -> ' + to_working_days(2, 35).to_s
p 'amos_schulung: 5:00 -> ' + to_working_days(5, 0).to_s

puts
p 'Do. 13.03'
p 'map_jobba: 6:40 -> ' + to_working_days(6, 40).to_s
p 'amos_schulung: 2:30 -> ' + to_working_days(2, 30).to_s

puts
p 'Fr. 14.03'
p 'map_jobba: 3:20 -> ' + to_working_days(3, 20).to_s
p 'amos_schulung: 1:30 -> ' + to_working_days(1, 30).to_s

puts
p 'Mo. 17.03'
p 'map_jobba: 8:55 -> ' + to_working_days(8, 55).to_s

puts
p 'Di. 18.03'
p 'amos: 3:55 -> ' + to_working_days(3, 55).to_s
p 'map_jobba: 3:55 -> ' + to_working_days(3, 55).to_s

puts
p 'Mi. 19.03'
p 'amos & solar: 7:00 -> ' + to_working_days(7, 0).to_s
p 'map_jobba: 1:30  -> ' + to_working_days(1, 30).to_s

puts
p 'Do. 20.03'
p 'amos: 4:10 -> ' + to_working_days(4, 10).to_s
p 'map_jobba: 5:00  -> ' + to_working_days(5, 0).to_s

puts
p 'Mo. 31.03'
p 'map_jobba 7922: 7:00  -> ' + to_working_days(7, 0).to_s

p 'total PT' + to_working_days(72, 40).to_s
