module UsersHelper
	def is_faculty?
		@user.position.title == "faculty"
	end
end
