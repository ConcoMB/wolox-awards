class HomeController < ApplicationController

  def show
    return redirect_to new_user_session_path unless user_signed_in?
    redirect_to categories_path
  end

  def results
    check_user
    redirect_to :root unless @user.admin
     @winners = Category.all.map do |c|
      max_points = Vote.where(category: c).group(:nominee_id).count.max_by { |k,v| v }
      max_points = max_points.nil? ? nil : max_points[1]
      w = Vote.where(category: c).group(:nominee_id).count.select { |u, p| p == max_points }
      [c.name, w]
    end
  end

end