module ApplicationHelper
	def page_title
		if content_for?(:title)
			"Flix - #{content_for(:title)}"
		else
			"Flix"
		end
	end

	def title(title)
		content_for(:title, title)
	end
end
