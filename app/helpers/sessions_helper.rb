module SessionsHelper
  #Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  #Returns the curent logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: sesssion[:user_id])
  end
end
