class AddCategoryIdToDestinations < ActiveRecord::Migration[5.1]
  def change
    add_column :destinations, :category_id, :integer
  end
end
