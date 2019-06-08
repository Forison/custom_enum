public
def my_each
  if self.class == Array
    self.size.times{ |i| yield self[i] }
  end
  if self.class == Hash
    self.size.times{ |i| yield self.keys[i] ,self.values[i] }
  end
end

def my_each_with_index
    self.size.times{|a| yield self[a] , a}
end

arr=[1,2,3,4,5]
arr.my_each_with_index{ |a,q| puts "#{a} this other #{q}" }
puts "--------------------"
arr.each_with_index{ |a,q| puts "#{a} this other #{q}" }
