public

def my_count(arg = nil)
   count = 0
   if arg.nil?
     self.size.times { |x| count += 1 }
   else
     self.size.times { |w| count += 1 if self[w] == arg }
   end
   self.size.times { |w| count += 1 if yield self[w] }  if block_given?
   count
end
a=[1,2,8,nil]
puts a.my_count