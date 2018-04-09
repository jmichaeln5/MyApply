class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception



  # def current_user
  #   puts "***"
  #   puts "Session User ID: #{session[:user_id]}"
  #   params[:job] = session[:user_id]
  #   puts "***"
  #
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id] #if it is equal to nil then they need to login ----- if true continue on that session
  # end
  #
  # def current_job
  #   if session[:job_id]
  #     Job.find(session[:job_id])
  #   else
  #     Job.new
  #   end
  # end
  #
  # def job
  #
  # end

end
