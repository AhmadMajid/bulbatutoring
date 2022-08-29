module TutorHelper
  def tutor_rating_percentage(tutor:, rating:)
    return 0 if tutor.reviews_count.zero?

    ((tutor.reviews.where(rating: rating).size.to_f / tutor.reviews_count) * 100).to_i
  end
end
