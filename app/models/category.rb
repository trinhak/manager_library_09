class Category < ApplicationRecord
  has_many :book

  scope :search_by_name, -> search do
    where("name LIKE ?", "%#{search}%") if search.present?
  end
end
