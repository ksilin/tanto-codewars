require 'rspec'

def to_working_days(hours = 0.0, minutes = 0.0)
  hours/8.0 + minutes/480.0
end


describe 'Transforming from hours and minutes to working days' do

  #it 'should transform 8 hrs to 1 day' do
  #  to_working_days(8).should == 1
  #end
  #
  #it 'should transform 60 minutes to 1/8 (0.125) day' do
  #  to_working_days(0, 60).should == 0.125
  #end
  #
  #it 'should transform1 hr and 60 minutes to 1/4 (0.25) day' do
  #  to_working_days(1, 60).should == 0.25
  #end

end


p '02.03'
p 'itemstyle: 4:35 -> ' + to_working_days(4, 35).to_s
p 'soap tester: 5:10 -> ' + to_working_days(5, 10).to_s
puts
p '02.04'
p 'ws mock server configs: 8:05 -> ' + to_working_days(8, 5).to_s
puts
p '02.05'
p 'new arch: 9:35 -> ' + to_working_days(9, 35).to_s
puts
p '02.06'
p 'softarch: 2:05 -> ' + to_working_days(2, 05).to_s
p 'rom_exp_item: 5:25 -> ' + to_working_days(5, 25).to_s
puts
p '02.07'
p 'romexp: 8:25 -> ' + to_working_days(8, 25).to_s
puts
p '02.10'
p 'partially cust exp - see PT'
p 'romexp: 9:00 -> ' + to_working_days(9, 0).to_s
puts
p '02.11'
p 'cust exp: 6:45 -> ' + to_working_days(6, 45).to_s
puts
p '02.12'
p 'cust exp: 3:25 -> ' + to_working_days(3, 25).to_s
p 'merge: 5:30 -> ' + to_working_days(5, 30).to_s
p 'total: 8:55 -> ' + to_working_days(8, 55).to_s
puts
p '02.13, Do'
p 'cust exp: 3:15 -> ' + to_working_days(3, 15).to_s
p 'merge: 4:15 -> ' + to_working_days(4, 15).to_s
p 'total: 7:30 -> ' + to_working_days(7, 30).to_s
puts
p '02.14, Fr'
p 'merge: 8:20 -> ' + to_working_days(8, 20).to_s
puts
p '02.17, Mo'
p '7240: 3:30 -> ' + to_working_days(3, 30).to_s
p 'something 7662: 5:15 -> ' + to_working_days(5, 15).to_s

puts
p '02.18, Di'
p '7240: dev guidelines: 3:15 -> ' + to_working_days(3, 15).to_s
p 'merge & RM: 5:30 -> ' + to_working_days(5, 30).to_s
puts
p '02.19, Mi'
p '7240: 3:40 -> ' + to_working_days(3, 40).to_s
p 'prod_hilfe 7662: 2:00 -> ' + to_working_days(2, 0).to_s
p 'something 7662: 3:30 -> ' + to_working_days(3, 30).to_s
puts
p '02.20, Do'
p 'meetings: : 2:30 -> ' + to_working_days(2, 30).to_s
p 'prod hilfe : 1:55 -> ' + to_working_days(1, 55).to_s
p 'rfactura 7662: 5:30 -> ' + to_working_days(5, 30).to_s
puts
p '02.21, Fr'
p 'rfactura 7662: 3:45 -> ' + to_working_days(3, 45).to_s
p 'rfactura 7662: 4:55 -> ' + to_working_days(4, 55).to_s
puts
p '02.24, Mo'
p 'map_inv_exp, map_jobba  7662: 9:00 -> ' + to_working_days(9, 00).to_s
puts
p '02.25, Di'
p 'map_inv_exp, map_jobba  7662: 8:00 -> ' + to_working_days(8, 00).to_s
puts
p '02.26, Mi'
p 'map_inv_exp, map_jobba  7662: 8:05 -> ' + to_working_days(8, 05).to_s
#p 'adidas 6:35 -> ' + to_working_days(6, 35).to_s
#p 'a + c 7:50 -> ' + to_working_days(7, 50).to_s
#
#p 'adidas 9:00 -> ' + to_working_days(9, 0).to_s
#p 'adidas 6:25 -> ' + to_working_days(6, 25).to_s
#p 'adidas 9:00 -> ' + to_working_days(9, 0).to_s

p 'nachtrag: 8:35 -> ' + to_working_days(8, 35).to_s