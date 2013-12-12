require 'rspec'

# http://www.codewars.com/dojo/katas/5270d0d18625160ada0000e4/play/ruby

def score( dice )

  grouped = dice.reduce({}){ |result, eyes|
    result[eyes] ||= 0
    result[eyes] += 1
    result
  }

  p "grouped from #{dice.inspect}: #{grouped.inspect}"

  triples = grouped.reject{|k, v| v < 3}
  score = triples.reduce(0){|sum, entry|
    sum += entry[0] == 1 ? 1000 : entry[0]*100
    sum
  }


  # TODO - select and reject do not return the same type
  # select returns an array
  # reject returns a hash
  valuable_casts = grouped.reject{|k, v| ![1, 5].include? k }
  p "remaining valuable casts: #{valuable_casts.inspect}"

  p grouped.reject{|k, v| ![1, 5].include? k }
  p grouped.select{|k, v| [1, 5].include? k }

  removed_triples = triples.keys.select{|k| [1, 5].include? k}.each{|with_triple| valuable_casts[with_triple] -=3}
  p removed_triples
  score += (removed_triples[1] || 0) * 100;
  score += (removed_triples[5] || 0) * 50;

  # score += grouped.reject{|k, v| v > 2}

  score
end

describe 'My behaviour' do

  let(:no_points){[2, 3, 4, 6, 2]}
  let(:single_1_100_points){[1, 3, 4, 6, 2]}
  let(:single_5_50_points){[5, 3, 4, 6, 2]}
  let(:two_5_100_points){[5, 5, 4, 6, 2]}
  let(:triple_1_1000_points){[1, 1, 1, 3, 3]}

  #subject{score(no_points)}
  #it {should be 0}
  it {expect(score(no_points)).to be 0}

  #subject{score(single_1_100_points)}
  #it {should be 100}
  it {expect(score(single_1_100_points)).to be 100}

  it {expect(score(single_5_50_points)).to be 50}

  #subject{score(triple_1_1000_points)}
  it {expect(score(triple_1_1000_points)).to be 1000}

  it 'should assign no score to single digits <> [1, 5]' do
    #expect(score(no_points)).to == 0
    score(no_points).should == 0
  end
end