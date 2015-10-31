class Admin::ItemsController < AdminController
  before_action :find_item, only: [:edit, :update, :destroy]
  before_action :find_category, only: [:edit, :destroy, :new, :create]

  def create
    item = @category.items.build(item_params)
    if item.save
      flash[:notice] = "Successfully created item"
      redirect_to category_items_path(@category)
    else
      flash[:errors] = "Item not created"
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      flash[:notice] = "Successfully Updated"
      redirect_to category_items_path(@item.category)
    else
      flash[:errors] = "Invalid update params"
      redirect_to edit_admin_item_path(@item)
    end
  end

  def destroy
    @item.destroy
    redirect_to category_items_path
  end

  def new
    @item_creator = ItemCreator.new(@category)
  end

    private

    def find_item
      @item = Item.find(params[:id])
    end

    def find_category
      @category = Category.find(params[:category_id]) if params[:category_id]
    end

    def item_params
      params.require(:item).permit(:name, :description, :price, :category_id,
        :image_url)
    end
end
