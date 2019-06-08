public
def my_each
  if self.class == Array
    self.size.times{ |i| yield self[i] }
  end
  if self.class == Hash
    self.size.times{ |i| yield self.keys[i] ,self.values[i] }
  end
end



puts [1, 2, 3, 4, 5].my_count
puts [1, 2, 3, 4, 5].count { |n| n > 3}
puts [1, 2, 3, 4, 5].my_count { |n| n > 3}