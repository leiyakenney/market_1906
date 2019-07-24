class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map { |vendor| vendor.name }
  end

  def vendors_that_sell(food)
    food_vendor = []

    @vendors.each do |vendor|
      if vendor.inventory.keys.include?(food)
        food_vendor << vendor
      end
    end
    food_vendor
  end

end
