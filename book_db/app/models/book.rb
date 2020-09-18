class Book < ApplicationRecord

    scope :newest_first, -> {order(:published_date => :desc)}
    scope :get_newest, -> {order(:published_date => :desc).limit(1)}
    scope :search, lambda {|input| where(["book_title LIKE ?", "%#{input}%"])}

end
