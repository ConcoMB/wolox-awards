class CategoriesController < ApplicationController

  before_filter :check_user

  def index
    @open_categories = Category.where(is_open: true)
    @exclusive_categories = Voter.where(user: @user).map { |a| a.category }
  end

  def show
    @category = Category.find(params[:id])
    redirect_to :back if !@user.can_vote?(@category)
    @votes = Vote.where(category: @category)
    @winner = Vote.where(category: @category).group(:nominee_id).count.max_by { |k,v| v }
    @your_vote = Vote.find_by(category: @category, user: @user)
  end

end
