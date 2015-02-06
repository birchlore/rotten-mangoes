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

    def filter_length(option)
      case option
      when '2' 
        where(["movies.runtime_in_minutes < ?", 90])
      when '3'
        where(["movies.runtime_in_minutes > ? AND movies.runtime_in_minutes < ?", 90, 120])
      when '4'
        where(["movies.runtime_in_minutes > ?", 120])
      end
    end



  end

  protected

  def release_date_is_in_the_future
    if release_date.present?
      errors.add(:release_date, "should probably be in the future") if release_date < Date.today
    end
  end

end