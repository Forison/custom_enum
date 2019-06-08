module Enumerable
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


def my_select
  temp=[]
  if self.class==Array
    temp = []
    my_each do |x|
        temp push(x) if yield(x)
    end
    temp
  end
  if self.class == Hash
    temp = {}
    my_each do |keys, values|
        temp[keys] = value if yield(keys, values)
    end
     temp
  end
end

 def my_all?(*arg)
  if block_given?
       (self.size).times do |w|
       return false if self[w]==nil || yield(self[w])==false
      end

  else 
    self.each do |obj| 
    return false if obj ==false || obj==nil
      return true
    end
    self.size==0?true:true
    end
  return true if self.size==0
  true
end

def my_any?(*arg)
  if block_given?
    self.my_each { |a| return true if yield(a) } 
  else
    self.my_each { |a| return true if a }
  end
  if arg.empty?
   return false if self.size == 0  
  end
 false
end

def my_none?
  if block_given?
    (self.size).times do |w|
      return true if self[w] == nil || yield(self[w]) == false
    end
  else 
    self.each do |obj| 
      return true if obj == false || obj == nil
      return false
    end
      self.size == 0? false:false
  end
    return false if self.size == 0
  false

end

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

def my_map
  if self.class==Array
    self.size.times{ |i| yield self[i] }
  end
  if self.class==Hash
    self.size.times{ |i| yield self.keys[i] ,self.values[i] } 
  end
end

def my_inject(param = nil)
    if param.nil?
      acc = self.first
      1.upto( self.size-1 ){ |value| acc = yield(acc, self[value]) }
      acc
    else
      acc = param
      self.size.times{ |value| acc = yield(acc, self[value]) }
      acc
    end
end

def multiply_els(arr)
  arr.my_inject { |product, value| product * value}
end

end