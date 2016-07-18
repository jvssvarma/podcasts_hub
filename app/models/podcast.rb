class Podcast < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :image, styles: { large: "1000x1000#", medium: "550x550#" },
                :url  => ":s3_domain_url",
                :path => "public/image/:id/:style_:basename.:extension",
                :storage => :fog,
                :fog_credentials => {
                  provider: 'AWS',
                  aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
                  aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
                  region: ENV["AWS_REGION"]
                },
                fog_directory: ENV["AWS_BUCKET"]
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_many :episodes
end
