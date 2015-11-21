class VotesController < ApplicationController

  before_filter :check_user

  def create
    @category = Category.find(params[:id])
    redirect_to :back if !@user.can_vote?(@category) || @user.voted?(@category)
    v = resource_params.first
    v.merge!({ nominee_id: @category.nominees[rand(User.all.count)].id }) if @category.random
    @vote = Vote.create!(v)
  end

  private

  def resource_params
    return [] if request.get?
    [params.require(:vote).permit(:category_id, :user_id, :nominee_id)]
  end

end
