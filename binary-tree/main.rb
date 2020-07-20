class Node
  attr_accessor :data, :left, :right
  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

class Tree

  def initialize(array)
    @array = array.sort
    @root = build_tree(@array)
  end

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

end

def pretty_print(node = root, prefix="", is_left = true)
  pretty_print(node.right, "#{prefix}#{is_left ? "│ " : " "}", false) if node.right
  puts "#{prefix}#{is_left ? "└── " : "┌── "}#{node.data.to_s}"
  pretty_print(node.left, "#{prefix}#{is_left ? " " : "│ "}", true) if node.left
end

tree = Tree.new([3, 2, 1])
root = tree.build_tree([3, 2, 1])
pretty_print(root)