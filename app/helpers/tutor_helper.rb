module TutorHelper
  def tutor_rating_percentage(tutor:, rating:)
    ((tutor.reviews.where(rating: rating).size.to_f / tutor.reviews_count) * 100).to_i
  end
end
