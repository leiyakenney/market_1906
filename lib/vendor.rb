class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(food)(amt = 0)
    stock = Hash.new
    @inventory.each do |name,amt|
      stock[name] = amt
    end
    stock.values.sum
  end

  def stock(name, amt)
  #adding to existing inv hash
    if @inventory.keys.include?(name)
      inventory[name] += amt
    else
      inventory[name] = amt
    end
  end

end
