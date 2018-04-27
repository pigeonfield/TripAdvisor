class AddAttachmentDestinationImgToDestinations < ActiveRecord::Migration[5.1]
  def self.up
    change_table :destinations do |t|
      t.attachment :destination_img
    end
  end

  def self.down
    remove_attachment :destinations, :destination_img
  end
end
