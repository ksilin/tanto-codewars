require 'rspec'

def check_ages?(data, sex, age_is_older_than)
  data.reduce([]) { |res, e|
    res << e if sex == e[:sex]
    res
  }.all? { |e|
    e[:age] > age_is_older_than
  }
end

def check_ages2?(data, sex, age_is_older_than)
  data.reject { |e|
    sex != e[:sex]
  }.all? { |e|
    age_is_older_than < e[:age]
  }
end

data = [
    {age: 40, sex: :m},
    {age: 24, sex: :f},
    {age: 56, sex: :m},
    {age: 45, sex: :m},
    {age: 23, sex: :f}
]

describe 'filters array of hashes by sex' do

  p check_ages2?(data, :f, 22)

end