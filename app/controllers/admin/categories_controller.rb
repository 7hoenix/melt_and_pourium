class Admin::CategoriesController < AdminController
  def new
    @category = Category.new
  end
end
