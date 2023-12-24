class UsersController < ApplicationController
  def search
  end

  def search_results
    @users = User.where.not(id: current_user.id).search(params[:keyword])
  end

end
