class AddAttachmentAudioFileToEpisodes < ActiveRecord::Migration
  def self.up
    change_table :episodes do |t|
      t.attachment :audio_file
    end
  end

  def self.down
    remove_attachment :episodes, :audio_file
  end
end
