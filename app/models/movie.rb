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

    def search(search_term)
      where("title LIKE ? OR director LIKE ?", "%#{search_term}%", "%#{search_term}%")
    end

  end

  protected

  def release_date_is_in_the_future
    if release_date.present?
      errors.add(:release_date, "should probably be in the future") if release_date < Date.today
    end
  end

end