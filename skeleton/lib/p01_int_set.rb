class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max + 1, false)
  end

  def insert(num)
    raise "Out of bounds" if num < 0 || num > @max 
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  
  
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num unless self.include?(num)
  end

  def remove(num)
    self[num].delete(num) #if self.include?(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  #private
  
  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    bucket_number = num % 20
    @store[bucket_number]
  end

  def num_buckets
    @store.length
  end
end



class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count == @store.count 
    unless self.include?(num)
      self[num] << num 
      @count += 1
    end 
  end

  def remove(num)
    if include?(num)
      self[num].delete(num) 
      @count -= 1
    end 
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    bucket_number = num % @store.length
    @store[bucket_number]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(@store.length * 2) { Array.new } 
    
    @store.each do |bucket| 
      bucket.each do |el| 
        new_bucket = el % new_store.length
        new_store[new_bucket] << el 
      end 
    end 
    
    @store = new_store
  end
end
