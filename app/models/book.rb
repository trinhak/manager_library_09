class Book < ApplicationRecord
  belongs_to :category
  belongs_to :author

  mount_uploader :picture, PictureUploader
  validate :picture_size
  scope :sort_by_alphabet, ->{order name: :asc}
  scope :search_by_name, -> (search) do
   where("name LIKE ?", "%#{search}%") if search.present?
  end

  private

  def picture_size
    if picture.size > Settings.user.picture_size.megabytes
      errors.add(:picture, t("books.new.picture"))
    end
  end
end
