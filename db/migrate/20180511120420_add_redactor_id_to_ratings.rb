class AddRedactorIdToRatings < ActiveRecord::Migration[5.1]
  def change
    add_column :ratings, :redactor_id, :integer
  end
end
