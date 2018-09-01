class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    result = 0
    
    self.each_with_index do |el, i|
      result += (el.hash) * (i.hash)
    end
    
    result
  end
end

class String
  def hash
    self.chars.map { |ch| ch = ch.ord }.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.sort.hash
  end
end
