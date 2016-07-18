class Episode < ActiveRecord::Base
  belongs_to :podcast

  has_attached_file :episode_image, :styles => { :large => "1000x1000#", :medium => "550x550#" },
                :url  => ":s3_domain_url",
                :path => "public/audio/:id/:style_:basename.:extension",
                :storage => :fog,
                :fog_credentials => {
                  provider: 'AWS',
                  aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
                  aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
                  region: ENV["AWS_REGION"]
                },
                fog_directory: ENV["AWS_BUCKET"]
  
  has_attached_file :audio_file,
                :url  => ":s3_domain_url",
                :path => "public/audio/:id/:style_:basename.:extension",
                :storage => :fog,
                :fog_credentials => {
                  provider: 'AWS',
                  aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
                  aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
                  region: ENV["AWS_REGION"]
                },
                fog_directory: ENV["AWS_BUCKET"]
  
  validates_attachment_content_type :episode_image, content_type: /\Aimage\/.*\Z/

  validates_attachment :audio_file, :content_type => { :content_type => ["audio/mpeg", "audio/mp3"] }, :file_name => { :matches => [/mp3\Z/] }

end
