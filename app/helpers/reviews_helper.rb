module ReviewsHelper
	def relative_review_time(review)
		time_ago_in_words(review.created_at) + " ago"
	end
end
