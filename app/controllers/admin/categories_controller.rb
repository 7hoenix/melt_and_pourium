class Admin::CategoriesController < AdminController
  def new
    @category = Category.new
  end

  def create
    category = Category.new(category_params)
    if category.save
      flash[:notice] = "Successfully created category"
      redirect_to categories_path
    else
      flash[:errors] = "Invalid category params"
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :image_url)
  end
end
