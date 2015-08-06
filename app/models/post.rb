class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  field :title, type: String
  field :description, type: String
  field :user_id, type: BSON::ObjectId

  validates_presence_of :title, :description

  scope :search,   lambda{|arg|
    return where(nil) unless arg.present?
    where(title: /^#{arg}/i)
  }
end
