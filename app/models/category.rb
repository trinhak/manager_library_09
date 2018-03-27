class Category < ApplicationRecord
  has_many :book, dependent: :destroy

  scope :search_by_name, -> search do
    where("name LIKE ?", "%#{search}%") if search.present?
  end
end
