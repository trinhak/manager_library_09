json.extract! borrow_book, :id, :user_id, :borrow_start, :borrow_end, :quantity, :status, :created_at, :updated_at
json.url borrow_book_url(borrow_book, format: :json)
