class Author < ApplicationRecord
  has_many :author_follows, dependent: :destroy
  has_many :books, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.user.name_length}

  scope :order_name, ->{order(name: :asc)}
  scope :search_by_name, ->(search){where("name LIKE ?", "%#{search}%") if search.present?}
end
