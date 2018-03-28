class Book < ApplicationRecord
  belongs_to :category
  belongs_to :author

  mount_uploader :picture, PictureUploader
  validate :picture_size
  scope :sort_by_name, ->{order name: :asc}
  scope :search_by_name, -> search do
    where("name LIKE ?", "%#{search}%") if search.present?
  end
  before_destroy :check_if_has_line_item

  private

  def picture_size
    if picture.size > Settings.user.picture_size.megabytes
      errors.add(:picture, t("books.new.picture"))
    end
  end

  def check_if_has_line_item
    errors.add(:base, t("books.form.massege")) unless line_items.empty?
  end
end
