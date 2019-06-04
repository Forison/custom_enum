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
  true
end

# end
a=[nil]
puts a.my_all?