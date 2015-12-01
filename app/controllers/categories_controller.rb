class CategoriesController < ApplicationController

  before_filter :check_user

  def index
    @open_categories = Category.where(is_open: true)
    @exclusive_categories = Voter.where(user: @user).map { |a| a.category }
    @your_votes = Vote.where(user: current_user).map { |v| { v.category.id => v.nominee.user } }.reduce(&:merge)
  end

  def show
    @category = Category.find(params[:id])
    redirect_to :back if !@user.can_vote?(@category)
    @nominees = @category.nominees.includes(:user).shuffle
    @votes = Vote.where(category: @category)
    max_points = Vote.where(category: @category).group(:nominee_id).count.max_by { |k,v| v }
    @winners = Vote.where(category: @category).group(:nominee_id).count.select { |u, p| p == max_points }
    @your_vote = Vote.find_by(category: @category, user: @user)
  end

end
