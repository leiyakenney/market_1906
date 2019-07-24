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

  def vendors_that_sell(item)
    food_vendor = []

    @vendors.each do |vendor|
      if vendor.inventory.keys.include?(item)
        food_vendor << vendor
      end
    end
    food_vendor
  end

  def sorted_item_list
    items = []
    @vendors.each { |vendor| items << vendor.inventory.keys}
    items.flatten.uniq.sort
  end

  def total_inventory
    tot_inventory = Hash.new(0)

    @vendors.each do |vendor|
      vendor.inventory.each do |name,amt|
        tot_inventory[name] += amt
      end
    end
    tot_inventory
  end

  def sell(item, amt)
    if total_inventory[item] < amt
      return false
    end

    @vendors.each do |vendor|
      if vendor.inventory.keys.include?(item)
        vendor.inventory[item] -= amt
      end
    end
    return true
  end

# =============WORK IN PROGRESS=============
# if any vendor includes the key of the item, put them into a separate hash
# then take out the item number from them


#   @vendors.each do |vendor|
#     legit_vendors = []
#     if vendor.inventory.keys.include?(item)
#       legit_vendors << vendor
#     end
#     legit_vendors.each do |vendor|
#       if vendor.inventory[item] < amt
#         vendor.inventory[item] = 0
#         amt = (amt -= vendor.inventory[item])
#       else
#       vendor.inventory[item] -= amt
#       end
#     end
#   end
#   return true
# end

end
