class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_reader :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    node = Node.new(value, nil)

    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next_node = node
      @tail = tail.next_node
    end
    @size += 1
  end

  def prepend(value)
    node = Node.new(value, @head.next_node)
    node.next_node = @head
    @head = node
    @size += 1
  end

  def at(index)
    node = @head
    index.times do
      node = node.next_node
    end
    node
  end

  def pop
    if @size == 1
      @head, @tail = nil, nil
      @size = 0
    else
      new_tail = @head
      (@size - 2).times { new_tail = new_tail.next_node }
      @tail = new_tail
      @tail.next_node = nil
      @size -= 1
    end
  end

  def contains?(value)
    node = @head
    until node.nil?
      return true if node.value == value
      node = node.next_node
    end
    false
  end

  def find(value)
    node = @head
    index = 0
    until node.nil?
      return index if node.value == value
      node = node.next_node
      index += 1
    end
    nil
  end

  def to_s
    node = @head
    until node.nil?
      print "( #{node.value} ) -> "
      node = node.next_node
    end
    puts "nil"
  end

  def insert_at(index, value)
    if index == 0
      self.prepend(value)
    elsif index >= @size
      nil
    else
      self.at(index-1).next_node = Node.new(value, self.at(index-1).next_node)
      @size += 1
    end
  end

  def remove_at(index)
    if index == 0
      @head = @head.next_node
      @size -= 1
    elsif index == @size - 1
      self.pop
    else
      self.at(index - 1).next_node = self.at(index).next_node
      @size -=1
    end
  end

end
