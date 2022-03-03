module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each()
    for e in self do
      yield e
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < self.length
      yield self[i],i
      i+=1
    end
    self
  end

  def my_select
    ret = []
    for e in self do
      ret<<e if(yield e)
    end
    ret
  end

  def my_all?
    return unless block_given?
    for e in self do
      return false unless yield e
    end
    return true
  end

  def my_any?
    return unless block_given?
    for e in self do
      return true if yield e
    end
    return false
  end

  def my_none?
    return unless block_given?
    for e in self do
      return false if yield e
    end
    return true
  end

  def my_count
    return self.length unless block_given?
    count=0
    for e in self do
      count+=1 if yield e
    end
    count
  end

  def my_map
    return self unless block_given?
    res=[]
    for e in self do
      res << (yield e)
    end
    res
  end

  def my_inject(initial_value)
    val=initial_value
    return val unless block_given?

    for e in self do
      val = (yield val,e)
    end
    val
  end
    
end
