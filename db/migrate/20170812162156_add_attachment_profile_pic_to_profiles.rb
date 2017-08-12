class AddAttachmentProfilePicToProfiles < ActiveRecord::Migration[5.1]
  def self.up
    change_table :profiles do |t|
      t.attachment :profile_pic
    end
  end

  def self.down
    remove_attachment :profiles, :profile_pic
  end
end
