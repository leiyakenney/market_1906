class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(food)
    unless @inventory[food] < 0
      @inventory[food]
    else
      0
    end 
  end

  def stock(name, amt)
    @inventory[name] += amt
  end

end
