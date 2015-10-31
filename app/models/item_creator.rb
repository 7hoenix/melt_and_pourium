class ItemCreator
  attr_reader :category

  def initialize(category)
    @category = category
  end

  def item
    @item ||= Item.new
  end
end
