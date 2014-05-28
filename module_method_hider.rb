require 'pry'

# TODO: this would be nice - a method hider module - it writes modules with the included hook
# so when it is included, it generates a 'maze' of ancestors. Perhaps it hides something

module MethodHider

  def self.included(base)
    r = rand(0..9)
    if r < 8
      m = create_module
      # you will not get a name for your newly created base module
      # since the first call to const_set has not yet returned
      puts "including #{m} into #{base}"
      base.send :include, m
    end
  end

  def self.create_module
    dynamic_name = "NothingHere_#{rand(1..9999)}"
    puts "defining module #{dynamic_name}"
    Object.const_set(dynamic_name, Module.new {
      include MethodHider

      # TODO: once the method is hidden, signal the hider to stop
      # do not only pile modules up, derive classes and include modules into them

      if rand(1..10) > 5
        def self.hidden_method
          p 'you have found the hidden method'
        end
      end
    })
  end
end

# this should explode the stack if inclusion is endlessly recursive:

class Inflammable
  include MethodHider # BAM!

  puts 'ancestors:'
  puts ancestors.inspect
  puts ancestors.each { |a| puts "#{a.inspect}: #{a.singleton_methods.grep(/hidden/)}" }
  puts 'nesting:'
  puts Module.nesting.inspect
  puts 'constants:'
  puts constants.inspect
  puts 'included modules:'
  puts included_modules.inspect

end

class Deriver

  def self.inherited(klass)
    a = "RandomClass_#{rand(1..9999)}"
    puts "my class name: #{a}, inherited by #{klass.inspect}"
    const_set(a, Class.new(klass)) if rand(1000) == 3
    puts "and the constant: #{const_get(a)}"
  end

end

# Object.module_eval("::SomeClassName", __FILE__, __LINE__)

class X < Deriver
end


# TODO: explore the hierarchy of Inflammable
