public
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
a=[2,4,5]
puts a.my_all?