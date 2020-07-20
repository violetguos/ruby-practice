class Node
  attr_accessor :data, :left, :right
  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

class Tree
  def build_tree(array)
    if array.length == 0
      return nil
    end

    # choose partition
    middle = array.length / 2

    root = Node.new(array[middle])
    return root if array.length == 1

    root.left = build_tree(array[0..middle-1])
    root.right = build_tree(array[middle+1..array.length])
    return root
  end

  def initialize(array)
    @array = array.uniq.sort
    @root = build_tree(@array)
  end


  def insert(data, root=@root)
    if root == nil
      return root = Node.new(data)
    end

    if (data > root.data)
      if root.right == nil
        root.right = Node.new(data)
      else
        insert(data, root.right)
      end
    else
      if root.left == nil
        root.left = Node.new(data)
      else
        insert(data, root.left)
      end
    end
  end

  def pretty_print(node = @root, prefix="", is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? "│ " : " "}", false) if node.right
    puts "#{prefix}#{is_left ? "└── " : "┌── "}#{node.data.to_s}"
    pretty_print(node.left, "#{prefix}#{is_left ? " " : "│ "}", true) if node.left
  end

end



tree = Tree.new([3, 2, 1])
tree.insert(4)
tree.pretty_print()