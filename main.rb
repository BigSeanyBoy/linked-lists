# frozen_string_literal: true

# LinkedList represents the full list
class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    @head ||= new_node
    if !@tail
      @tail = new_node
    else
      @tail.next_node = new_node
    end
    @tail = new_node
  end

  def prepend(value)
    new_node = Node.new(value)
    new_node.next_node = @head
    @head = new_node
  end

  def size
    size = 0
    current_node = @head
    while current_node
      size += 1
      current_node = current_node.next_node
    end
    size
  end

  def at(index)
    current_node = @head
    index.times do
      current_node = current_node.next_node
    end
    current_node
  end

  def pop
    nil if size < 1
    current_node = @head
    current_node = current_node.next_node until current_node.next_node == @tail
    current_node.next_node = nil
    @tail = current_node
  end

  def contains?(value)
    current_node = @head
    size.times do
      return true if current_node.data == value

      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    current_node = @head
    index = 0
    while current_node
      return index if current_node.data == value

      index += 1
    end
    nil
  end

  def to_s
    current_node = @head
    while current_node
      print "( #{current_node.data} ) -> "
      current_node = current_node.next_node
    end
    print 'nil'
  end

  def insert_at(value, index)
    return puts 'Cannot select and index outside of the list' if index > size

    new_node = Node.new(value, at(index))
    if index.zero?
      @head = new_node
    else
      prev_node = at(index - 1)
      prev_node.next_node = new_node
      @tail = new_node if new_node.next_node.nil?
    end
  end

  def remove_at(index)
    return puts 'Cannot select and index outside of the list' if index > size

    if index.zero?
      @head = at(1)
    elsif at(index) == @tail
      pop
    else
      prev_node = at(index - 1)
      prev_node.next_node = at(index + 1)
    end
  end
end

# Node represents nodes that will make up the list
class Node
  attr_reader :data

  def initialize(data = nil, next_node = nil)
    @data = data
    @next_node = next_node
  end

  def value
    nil
  end

  def next_node
    nil
  end
end
