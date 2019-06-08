public
def my_each
  if self.class == Array
    self.size.times{ |i| yield self[i] }
  end
  if self.class == Hash
    self.size.times{ |i| yield self.keys[i] ,self.values[i] }
  end
end

arr=[1,2,3,4,5]
one=arr.my_select{ |y| y.even? }
# two=arr.select{|x| x.even?}
puts one
