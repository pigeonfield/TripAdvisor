class AddDestinationIdToRatings < ActiveRecord::Migration[5.1]
  def change
    add_column :ratings, :destination_id, :integer
  end
end
