# module Enumerable
    def my_each(arg)
      # your code here
      if arg.class==Array
      0.upto(arg.size-1){|i| yield arg[i]}
      end
      if arg.class==Hash
      (arg.length).times{|i| yield arg.keys[i] ,arg.values[i]} 
      end
    end

    def my_each_with_index(arg)
      (arg.length-1).times{|i| yield i}
    end
# end
a=[2,3]

puts my_each_with_index(a){|a,n| puts a}