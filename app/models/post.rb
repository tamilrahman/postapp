class Post
  include Mongoid::Document
  belongs_to :user
  field :title, type: String
  field :description, type: String
  field :user_id, type: BSON::ObjectId

  validates_presence_of :title, :description
end
