module ApplicationHelper

	def add_link name
		link_to(name, '#', class: "my_class")
	end
end
