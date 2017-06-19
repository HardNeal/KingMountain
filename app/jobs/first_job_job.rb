class FirstJobJob < ApplicationJob
  queue_as :default

  def perform(user)
  	# user = current_user

    if user.reffered_by == 0
	  system_users = User.where(level: user.level + 1)
	  system_user = system_users.first
	  
	  user.reffered_by = system_user.id
	  user.save
	elsif user.reffered_by == 0 && user.level == 1
		system_user = User.where(level: user.level)

		system_user.count

		if system_user.first.nil?
			user = user.first
			user.reffered_by = 0
		else
			system_user = system_user.first

			user.reffered_by = system_user
			user.save
		end
	end
  end
end
