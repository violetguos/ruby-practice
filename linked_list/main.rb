class LinkedList
  attr_accessor :head, :tail
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    if @head == nil && @tail == nil
      # empty list
      @head = new_node
      @tail = new_node
    elsif
      @tail.next_node = new_node
      @tail = new_node
    end
  end

  def prepend(value)
    new_node = Node.new(value)
    if @head == nil && @tail == nil
      #emptry list
      @head = new_node
      @tail = new_node
    elsif
      new_node.next_node = @head
      @head = new_node
    end
  end

  def size
    curr = @head
    cnt = 0
    while curr != nil
      cnt += 1
      curr = curr.next_node
    end
    return cnt
  end

  def at(index)
    curr = @head
    cnt = 0
    while cnt!=index
      cnt += 1
      curr = curr.next_node
    end
    return curr
  end

  def pop
    curr = @head
    while curr.next_node != @tail
      curr = curr.next_node
    end
    @tail = curr

  end

  def contains?(value)
    curr = @head
    found = false
    while curr != nil && !found
      if curr.value == value
        found = true
      end
      curr = curr.next_node
    end
    return found
  end

  def find(value) 
    curr = @head
    found = false
    index = 0
    while curr != nil && !found
      if curr.value == value
        found = true
      
      else
        index += 1
        curr = curr.next_node
      end
    end
    found == true ? index: nil
  end

  def to_s
    curr = @head
    str = ""

    while curr != nil
      str.concat("( ")
      str.concat(curr.value.to_s)
      str.concat(" )")
      str.concat(" -> ")
      curr = curr.next_node
    end
    if curr == nil
      str.concat("nil")
    end
    return str
  end

end

class Node
  attr_accessor :value, :next_node
  def initialize(value)
    @next_node = nil
    @value = value
  end
end


# simple test case
list = LinkedList.new
list.prepend(3)

list.append(1)
list.append(2)
list.prepend(0)
p list.to_s
p list.size
p list.at(2)
p list.contains?(4)
p list.contains?(3)
p list.find(2)