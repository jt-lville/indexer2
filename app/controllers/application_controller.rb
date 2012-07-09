class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_preference
    Preference.find(session[:preference_id])
    
    rescue ActiveRecord::RecordNotFound
      @preference = Preference.create
      session[:preference_id] = @preference.id
      @preference
  end
  
end
