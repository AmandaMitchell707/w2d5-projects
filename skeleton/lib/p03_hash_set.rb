class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count == @store.count 
    unless self.include?(key)
      self[key] << key 
      @count += 1
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if include?(key)
      self[key].delete(key) 
      @count -= 1
    end 
  end

  private

  def [](key)
    # optional but useful; return the bucket corresponding to `key`
    bucket_number = key.hash % num_buckets
    @store[bucket_number]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2) { Array.new } 
    
    @store.each do |bucket| 
      bucket.each do |key| 
        new_bucket = key.hash % new_store.length
        new_store[new_bucket] << key 
      end 
    end 
    
    @store = new_store
  end
end