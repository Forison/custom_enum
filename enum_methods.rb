module Enumerable
    def my_each(arg)
      # your code here
      if arg.class==Array
      0.upto(arg.size-1){|i| yield arg[i]}
      end
      if arg.class==Hash
       0.upto(arg.size-1){|i| yield arg.keys[i] ,arg.values[i]} 
      end
    end
end
# a=[2,3]
# h={2=> 'we',
#     3=> 'wew'
# }

# puts my_each(h){|a| puts a}