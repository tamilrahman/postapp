class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  belongs_to :user
  field :title, type: String
  field :description, type: String
  field :user_id, type: BSON::ObjectId

  has_mongoid_attached_file :picture, default_url: ":style/missing_picture.jpg"

  validates_presence_of :title, :description
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  scope :search,   lambda{|arg|
    return where(nil) unless arg.present?
    where(title: /^#{arg}/i)
  }
end
