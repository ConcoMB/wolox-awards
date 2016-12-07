class HomeController < ApplicationController

  def show
    return redirect_to new_user_session_path unless user_signed_in?
    redirect_to categories_path
  end

  def results
    check_user
    redirect_to :root if @user.nil? || !@user.admin
    @results = Category.all.map do |c|
      r = Vote.where(category: c).group(:nominee_id).count
      res = ""
      r.each { |a,b| res += "#{Nominee.find(a).user.name},#{b};" }
      res = res[0...-1]
      count = Vote.where(category: c).size
      [c.name, res, count]
    end
  end

end