module BooksHelper
  def gravatar_for_book book, size: Settings.user.avatar_size
    gravatar_id = Digest::MD5.hexdigest(book.name.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(book.picture.url, alt: book.name, class: "gravatar")
  end
end
