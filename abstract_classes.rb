#Andrew Melis
#OO Arch and Design
#Lab Deliverable 1 - Accounts and Portfolios

module Visitable
  def accept visitor
    visitor.visit self
  end
end

#component class, v1
class Component
  include Visitable
  attr_accessor :name, :parent, :sub_components, :current_value

  def initialize(name)
    @name = name
    @parent = nil
    @sub_components = Array.new
  end
  
  #fancy way of saying add_sub_component
  def <<(component)
    @sub_components << component
    component.parent = self
  end

  #get index
  def [](index)
    @sub_components[index]
  end

  #set index
  def []=(index,new_component)
    @sub_components[index] = new_component
  end

  def remove(component)
    @sub_components.delete(component)
    component.parent = nil
  end

end


class Composite < Component

end

#choose to implement these methods in base component class
#and then override for leaves
#in my opinion, should be able to call all methods on each class
class Security < Component
  def initialize(name)
    @name = name
    @parent = nil
    @sub_components = nil #can never have subcomponents
  end

  def <<(components)
    puts "not allowed for leaves!"
  end

  def [](index)
    puts "not allowed for leaves!"
  end

  def []=(index,new_component)
    puts "not allowed for leaves!"
  end

  def remove(component)
    puts "not allowed for leaves!"
  end
  
end

