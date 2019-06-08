public
def my_each
  if self.class == Array
    self.size.times{ |i| yield self[i] }
  end
  if self.class == Hash
    self.size.times{ |i| yield self.keys[i] ,self.values[i] }
  end
end
