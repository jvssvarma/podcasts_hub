class Podcast < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :image, styles: { large: "1000x1000#>", medium: "550x550#>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_many :episodes
end
