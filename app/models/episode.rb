class Episode < ActiveRecord::Base
  belongs_to :podcast

  has_attached_file :episode_image, styles: { large: "1000x1000#>", medium: "550x550#>" }
  validates_attachment_content_type :episode_image, content_type: /\Aimage\/.*\Z/
end
