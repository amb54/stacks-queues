class Queue
  def initialize
    @store = Array.new
  end

  def enqueue(element)
    @store.push(element)
  end

  def dequeue
    @store.shift
  end

  def front
    return @store[0]
  end

  def size
    return @store.length
  end

  def empty?
    return @store.empty?
  end

  def to_s
    return @store.to_s
  end
end
