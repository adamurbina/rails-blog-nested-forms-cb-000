class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content

  def tags_attributes=(attribute_hash)
    attribute_hash.each do |index, attributes|
      if attributes && attributes["name"].blank?
        tag = Tag.find_or_create_by(name: attribute_hash["name"])
        self.tags << tag
      end
    end
  end

end
