require 'rspec'

# This post started it all:
# http://blog.rubybestpractices.com/posts/gregory/040-issue-10-uses-for-modules.html

# a concise version of this experiment:
# http://rubyquicktips.com/post/1133877859/include-vs-extend

# And very much more info
# http://blog.jayfields.com/2006/05/ruby-extend-and-include.html
# http://www.railstips.org/blog/archives/2009/05/15/include-vs-extend-in-ruby/

# And with pictures:
# http://aaronlasseigne.com/2012/01/17/explaining-include-and-extend/

describe 'Self extension' do

  # at first, singleton method and self mixin have the same properies
  # they add a 'static' method
  it 'should add methods to class instance' do
    Extendable.meth_on_self
    Extendable.exuberate
  end

  it 'should not mix in eigenclass methods' do

    class SoapBox
      include Extendable
    end

    SoapBox.new.exuberate
    expect { SoapBox.new.meth_on_self }.to raise_error(NoMethodError)
  end


  it 'should not mix in eigenclass methods into singleton class' do

    class PaperBag
      extend Extendable
    end

    PaperBag.exuberate
    expect { PaperBag.meth_on_self }.to raise_error(NoMethodError)
  end

  it 'extend is expected to be used on regular objects' do

    a = String.new
    a.extend Extendable

    a.exuberate
    expect { a.meth_on_self }.to raise_error(NoMethodError)
  end

  it 'should include the inner method module' do

    class CanOpener
      extend Extendable
      act_as_something
    end

    CanOpener.new.inner_method
  end
end

# If you plan your Module to be a bag of methods,
# it probably does not make a difference whether you extend self
# or declare methods on the eigenclass

# extend self = self.singleton_class.send :include, self
# http://erniemiller.org/2012/11/29/ruby-tidbit-include-vs-extend-with-module-class-variables/

# More info on extend vs include:
# http://stackoverflow.com/questions/156362/what-is-the-difference-between-include-and-extend-in-ruby


Extendable = Module.new do

  module InnerMethods
    def inner_method
      puts 'inner'
    end
  end

  # if the module is extended, this will be a class method
  # so it can be used as a macro
  # the opt-in version of the self.included hook
  def act_as_something
    send :include, InnerMethods
  end

  # def self.included(base)
  #   base.send :include, InnerMethods
  # end
  # extend self

  # include is a private method. It is mwant to be called from the inside
  self.singleton_class.send :include, self
  # singleton_class is available since 1.9.2:
  # http://www.ruby-doc.org/core-1.9.2/Object.html#method-i-singleton_class

  def exuberate
    puts 'exuberating'
  end

  def self.meth_on_self
    puts 'exaggerating'
  end


end