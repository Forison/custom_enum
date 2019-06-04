module Enumerable
   
 def my_each
  # your code here
   if self.class==Array
     self.size.times{ |i| yield self[i] }
   end
   if self.class==Hash
     self.size.times{ |i| yield self.keys[i] ,self.values[i] } 
   end

 end

 def my_each_with_index(arg)
  (arg.length-1).times{|i| yield arg[i],i}
 end

 def my_select
   if block_given?
   if self.class ==Array
    temp=[]
    (self.size-1).times do |x|
        yield temp.push(x)
        return temp
    end
   end
   if self.class==Hash
    temp={}
    (self.size-1).times do |key,value|
        yield temp[key]=value
        return temp
    end
   end
 else
    "this method requires a block"
end

end



def my_all?(*arg)
  if block_given?
      (self.size).times do |w|
        # return false unless yield(self[w])
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
    (self.size).times do |w|
       return true if self[w]!=false || self[w]!=nil 
    end
  else
      self.each do |obj| 
         return true if obj ==false || obj==nil
         return true
        end
    self.size==0?false:false
  end
  return false if self.size==0
  false
end



def my_none
  if block_given?
    (self.size).times do |w|
     # return false unless yield(self[w])
    return true if self[w]==nil || yield(self[w])==false
  end

  else 
    self.each do |obj| 
    return true if obj ==false || obj==nil
    return false
    end
    self.size==0?false:false
  end
    return false if self.size==0
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
  # your code here
  if self.class==Array
    self.size.times{ |i| yield self[i] }
  end
  if self.class==Hash
    self.size.times{ |i| yield self.keys[i] ,self.values[i] } 
  end

end

def my_inject(param=nil)
    if param.nil?
      acc = self.first
      1.upto(self.size-1){ |value| acc = yield(acc, self[value]) }
      acc
    else
      acc = param
      self.size.times{ |value| acc = yield(acc, self[value]) }
      acc
    end
end

def multiply_els(arr)
    arr.my_inject {|product, current| product * current}
end
ar=[2,4,5]
puts multiply_els(ar)

end
