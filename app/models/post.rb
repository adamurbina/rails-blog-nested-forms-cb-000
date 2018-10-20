class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content
  #accepts_nested_attributes_for :tags, reject_if: proc { |attributes| attributes['name'].blank? }

  def tags_attributes=(attribute_hash)
    binding.pry
    if attribute_hash.[0].empty? && !attribute_hash["name"].blank?
      tag = Tag.find_or_create_by(name: attribute_hash["name"])
      self.tags << tag
    end
  end

end
