class AddAttachmentEpisodeImageToEpisodes < ActiveRecord::Migration
  def self.up
    change_table :episodes do |t|
      t.attachment :episode_image
    end
  end

  def self.down
    remove_attachment :episodes, :episode_image
  end
end
