require_relative '../../helpers/sessions_helper.rb'

class Api::SessionsController < ActionController::Base

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      render :json => { :info => "logged in", :user => user }, :status => 200
    else
      render :json => { :info => "error", :user => nil }, :status => 400
    end
  end

  def destroy
    render :json => { :info => "logged out", :user => nil}, :status => 200
  end

end
