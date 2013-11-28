require 'rspec'

def to_working_days(hours = 0.0, minutes = 0.0)
  hours/8.0 + minutes/480.0
end


describe 'Tranforming from hours and minutes to working days' do

  it 'should transform 8 hrs to 1 day' do
    to_working_days(8).should == 1
  end

  it 'should transform 60 minutes to 1/8 (0.125) day' do
    to_working_days(0, 60).should == 0.125
  end

  it 'should transform1 hr and 60 minutes to 1/4 (0.25) day' do
    to_working_days(1, 60).should == 0.25
  end

end

p to_working_days(7, 45)
p to_working_days(7, 35)
p to_working_days(9, 10)
p to_working_days(7, 30)