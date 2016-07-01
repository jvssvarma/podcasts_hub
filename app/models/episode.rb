class Episode < ActiveRecord::Base
  belongs_to :podcast

  has_attached_file :episode_image, styles => { :large => "1000x1000#", :medium => "550x550#" }
  validates_attachment_content_type :episode_image, content_type: /\Aimage\/.*\Z/

  has_attached_file :audio_file
  validates_attachment :audio_file, :content_type => { :content_type => ["audio/mpeg", "audio/mp3"] }, :file_name => { :matches => [/mp3\Z/] }

end
