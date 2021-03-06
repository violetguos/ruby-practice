class Node
  attr_accessor :data, :left, :right
  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

class Tree
  attr_accessor :root

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

  def delete(data)
    # find and delete
    return if @root == nil
    curr = @root
    prev = @root

    while curr && curr.data != data
      if data < curr.data
        prev = curr
        curr = curr.left
      else
        prev = curr
        curr = curr.right
      end
    end

    # 1. not found
    if curr == nil
      return
    else
      if curr.left && curr.right
        # promote either
        if curr.left.data > prev.data
          prev.right = curr.left
        elsif curr.right.data > prev.data
          prev.right = curr.right
        elsif curr.left.data < prev.data
          prev.left = curr.left
        elsif curr.right.data < prev.data
          prev.right = curr.right
        end
        curr = nil
      elsif curr.left && !curr.right
        if curr.left.data > prev.data
          prev.right = curr.left
        else
          prev.left = curr.left
        end
        curr = nil

      elsif curr.right
        # promote right
        if curr.right.data > prev.data
          prev.right = curr.right
        else
          prev.left = curr.right
        end
        curr = nil
      elsif !curr.left && !curr.right
        # delete and point ancestor to leaf
        if prev.right == curr
          prev.right = nil 
        elsif prev.left == curr
          prev.left = nil
        end
      end
    end
  end

  def find(data)
    # traversal
    curr = @root
    while curr
      if data < curr.data
        curr = curr.left
      elsif data > curr.data
        curr = curr.right
      elsif data == curr.data
        return curr
      end
    end
    # not found if here
    return
  end

  def pretty_print(node = @root, prefix="", is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? "│ " : " "}", false) if node.right
    puts "#{prefix}#{is_left ? "└── " : "┌── "}#{node.data.to_s}"
    pretty_print(node.left, "#{prefix}#{is_left ? " " : "│ "}", true) if node.left
  end

  def inorder(root=@root)
    if root == nil
      return
    end
    node_array = []
    node_array << inorder(root.left) if root.left
    node_array << root.data
    node_array << inorder(root.right) if root.right
    return node_array.flatten
  end

  def preorder(root=@root)
    if root == nil
      return
    end
    node_array = []

    node_array << root.data
    node_array << inorder(root.left) if root.left
    node_array << inorder(root.right) if root.right
    return node_array.flatten

  end
  
  def postorder(root=@root)
    if root == nil
      return
    end
    node_array = [] 
    node_array << inorder(root.left) if root.left
    node_array << inorder(root.right) if root.right
    node_array << root.data
    return node_array.flatten
  end

  def depth(node)
    
    return 0 if node == nil

    left = 1+ depth(node.left) 
    right = 1+ depth(node.right)
    left > right ? left : right
  end

  def balanced?
    if @root == nil
      return true
    end
    left_depth = depth(@root.left)
    right_depth = depth(@root.right)
    if (left_depth - right_depth).abs > 1
      return false
    else 
      return true
    end
  end

  def rebalance()
    values = inorder()
    @root = build_tree(values)
  end
end # end of class Tree


# driver script for testing
tree = Tree.new([66, 4, 37, 39, 83, 88])
tree.insert(3)

tree.pretty_print()
tree.delete(3)
tree.pretty_print()
p tree.find(4)
p tree.preorder()
p tree.depth(tree.root)
p tree.balanced?
# throw it off balance
tree.insert(120)
tree.insert(130)
tree.insert(140)
tree.insert(150)

tree.pretty_print
p tree.depth(tree.root)

p tree.balanced?
tree.rebalance
tree.pretty_print

