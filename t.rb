public
def my_each
  if self.class == Array
    self.size.times{ |i| yield self[i] }
  end
  if self.class == Hash
    self.size.times{ |i| yield self.keys[i] ,self.values[i] }
  end
end
 def my_map(proc = nil)
    if self.class == Array
      temp = []
      if proc.is_a? Proc
        my_each { |a| temp.push(proc.call(a)) }
      else
        my_each { |a| temp.push(yield(a) )}
      end
      temp
    elsif self.class == Hash
      temp = {}
      if proc.is_a? Proc
        my_each { |a, b| temp[a] = proc.call(a, b) }
      else
        my_each { |a, b| temp[a] = yield(a, b) }
      end
      temp
    end
  end

# def my_map(*arg)
#   if self.class==Array
#     self.size.times{ |i| yield puts self[i] }
#   end
#   if self.class==Hash
#     self.size.times do |i| 
#       yield 
#       puts "#{self.keys[i]}:#{self.values[i]}" 
#     end
#   end
# end

h= { 
  1 => 'a',
  2=> 'b'
}
puts h.my_map{ |a,b| b }
# puts [1,2,3,4].my_map{ |a|  a}
# # [1,2,3,4].each{ |a| puts a}
# puts [1,2,3,4].map{ |a| a}