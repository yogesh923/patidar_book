module ApplicationHelper

	def age_in_years user
		Time.now.to_date.year - user.dob.try(:year) unless user.dob.blank?
	end
end
