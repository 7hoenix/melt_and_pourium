class AddDefaultImageToCategory < ActiveRecord::Migration
  def change
    change_column :categories, :image_url, :string, default: "http://gemboutiquepa.com/wp-content/uploads/2014/08/Mix4.jpg"
  end
end
