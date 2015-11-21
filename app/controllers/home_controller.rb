class HomeController < ApplicationController

  def show
    return redirect_to new_user_session_path unless user_signed_in?
    redirect_to categories_path
  end

  def results
    check_user
    redirect_to :root unless @user.admin
     @winners = Category.all.map do |c|
      [c.name, Vote.where(category: c).group(:nominee_id).count.max_by { |k,v| v }]
    end
  end

end