module ApplicationHelper
  def user_signed_id?
    !current_user.nil?
  end

  def current_user
    puts "\n"*50
    puts "session #{session.inspect.to_yaml}"
    puts "\n"*50
    User.find_by(id: session[:user_id])
  end

end
