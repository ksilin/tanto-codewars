require 'rspec'
require 'date'

def to_working_days(hours = 0.0, minutes = 0.0)
  hours/8.0 + minutes/480.0
end

def to_date(month, day)
  Date.new(2014, month, day)
end


log = Hash.new{|h, k| h[k] = Hash.new{|ih, ik| ih[ik] = 0} }


accounts = ['7992_HF: CHT Support (3rd lvl)', '7871-E: WFD TSM 452 - Vermeidung Sendungssplits']


p 'Di. 01.04'

log[to_date(4, 1)][accounts[0]] = to_working_days(7, 25)
puts "log: #{log.inspect}"


p '7992 map_jobba: 7:25 -> ' + to_working_days(7, 25).to_s

puts
p 'Di. 02.04'
p '7992 map_jobba: 8:25 -> ' + to_working_days(8, 25).to_s

puts
p 'Do. 03.04'
p 'RT#3078 orddet storno: 7:40 -> ' + to_working_days(7, 40).to_s
p '7871: mandantenroutine 1:00 -> ' + to_working_days(1, 0).to_s

puts
p 'Fr. 04.04'
p 'RT#3078 orddet storno: 6:15 -> ' + to_working_days(6, 15).to_s

puts
p 'Mo. 07.04'
p '7922 - RT#3078 orddet storno: 8:30 -> ' + to_working_days(8, 30).to_s

puts
p 'Di. 08.04'
p '7871 RT#3103 WFD outlet: 7:55 -> ' + to_working_days(7, 55).to_s

puts
p 'Mi. 09.04'
p '7871 RT#3103 WFD outlet: 3:00 -> ' + to_working_days(3, 0).to_s
p '7922 map_jobba: 5:35 -> ' + to_working_days(5, 35).to_s

puts
p 'Do. 10.04'
p '7922 RT 2911 map_jobba: 2:45 -> ' + to_working_days(2, 45).to_s
p '7871 mandantenroutine: 1:30 ' + to_working_days(1, 30).to_s
p '7922 3099 UPS COD: 3:45 ' + to_working_days(3, 45).to_s

puts
p 'Fr. 11.04'
p '7922 3099 UPS COD: 5:10 -> ' + to_working_days(5, 10).to_s

puts
p 'Mo. 14.04'
p '7871 star QF spoc  RT#3117 amz export sam 4:00 -> ' + to_working_days(4, 0).to_s
p 'AMOS Architektur-Schulung: 3:15 -> ' + to_working_days(3, 15).to_s

puts
p 'Di. 15.04'
p 'RT#3117 amz export sam: 8:20 -> ' + to_working_days(8, 20).to_s

puts
p 'Mi. 16.04'
p '7871 HF WFD TSM 452 RT#3103: split 4:00 -> ' + to_working_days(4, 0).to_s
p '7922 HF WFD - RT#3099, 3127, 2911 & : 4:40 -> ' + to_working_days(4, 40).to_s

puts
p 'Do. 17.04'
p '7922 map_jobba:  -> 8:35 ' + to_working_days(8, 35).to_s


puts
p 'Di. 22.04'
p '7922 map_jobba:  -> 7:15 ' + to_working_days(7, 15).to_s


puts
p 'Mi. 23.04'
p '7922 map_jobba:  -> 7:10 ' + to_working_days(7, 10).to_s


puts
p 'Do. 24.04'
p '7922 map_jobba:  -> 4:15 ' + to_working_days(4, 15).to_s
p '7871 RT 3140 analyse:  -> 1:00 ' + to_working_days(1, 0).to_s
p '7871 mandantenroutine etc:  -> 1:30 ' + to_working_days(1, 30).to_s


puts
p 'Mo. 28.04'
p '7922 map_jobba:  -> 8:05 ' + to_working_days(8, 05).to_s
p '7871 RT 3144 wrap CHT GB :  -> 0:30 ' + to_working_days(0, 30).to_s

puts
p 'Di. 29.04'
p '7922 map_jobba:  -> 4:55 ' + to_working_days(4, 55).to_s
p '7871 Ampere Meeting :  -> 1:50 ' + to_working_days(1, 50).to_s

puts
p 'Di. 29.04'
p '7922 map_jobba:  -> 4:55 ' + to_working_days(4, 55).to_s
p '7871 mandantenroutine + release:  -> 1:25 ' + to_working_days(1, 50).to_s


p 'to working days: 5:30' + to_working_days(5, 30).to_s
