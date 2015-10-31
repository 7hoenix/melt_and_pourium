class Admin::CategoriesController < AdminController
  before_action :find_category, only: [:edit, :update, :destroy]

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

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "Successfully Updated"
      redirect_to categories_path
    else
      flash[:errors] = "Invalid update params"
      redirect_to edit_admin_category_path(@category)
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :image_url)
  end
end
