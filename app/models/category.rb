class Category < ApplicationRecord
  validates :name, presence: true
  has_many :tasks

  def self.get_category(name)
    Category.find_by(name:)
  end
end
