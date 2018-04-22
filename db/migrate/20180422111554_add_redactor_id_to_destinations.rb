class AddRedactorIdToDestinations < ActiveRecord::Migration[5.1]
  def change
    add_column :destinations, :redactor_id, :integer
  end
end
