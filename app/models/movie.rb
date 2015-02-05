class Movie < ActiveRecord::Base
  has_many :reviews
  belongs_to :user
  validates :title, presence: true
  validates :director, presence: true
  validates :runtime_in_minutes, numericality: { only_integer: true }
  validates :description, presence: true
  validates :release_date, presence: true
  validate :release_date_is_in_the_future
  mount_uploader :image, ImageUploader

  def review_average
    reviews.average(:rating_out_of_ten) if reviews
  end


  class << self 

    def filter_title(title)
      where("movies.title LIKE ? COLLATE NOCASE", "%#{title}%" )
    end

    def filter_director(director)
      where("movies.director LIKE ? COLLATE NOCASE", "%#{director}%" )
    end



  end

  protected

  def release_date_is_in_the_future
    if release_date.present?
      errors.add(:release_date, "should probably be in the future") if release_date < Date.today
    end
  end

end



#   scope :on_sale, -> { where(sale: true) }
#   # Is the same as
#   # def self.on_sale
#   #   where(sale: true)
#   # end

#   scope :starts_with_a, -> { where("books.title ILIKE ?", "a%") }
#   # The ActiveRecord guide recommends using class methods (see below)
#   # instead of scopes when you need to pass in a parameter
#   # http://guides.rubyonrails.org/active_record_querying.html#scopes

#   # scope :by_title, (title) -> { 
#   #   where("books.title ILIKE ?", "%#{title}%")
#   # }
#   def self.by_title(title)
#     where("books.title ILIKE ?", "%#{title}%")
#   end

#   def self.in_price_range(min_price, max_price)
#     where("price > ?", min_price).where("price < ?", max_price)
#   end

# end
