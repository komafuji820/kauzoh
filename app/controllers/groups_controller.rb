class GroupsController < ApplicationController
  def index
  end

  def add_members
    # メンバーリストに追加したユーザーのインスタンス変数を生成
    @users = Group.new(add_members_params)
    
    # session情報がない場合
    if session["members_list"] == nil
      session["members_list"] = {users: @users.attributes}
      session["members_list"][:users]["ids"] = params[:group][:user_ids]
      user_ids = session["members_list"][:users]["ids"]

    # session情報が存在する場合
    else
      session["members_list"]["users"]["ids"] << params[:group][:user_ids]
      user_ids = session["members_list"]["users"]["ids"]
    end

    # session情報からユーザーを検索
    @members = User.find(user_ids)
  end

  def new
    if session["members_list"] == nil
      @group = Group.new
    else
      @group = Group.new
      user_ids = session["members_list"]["users"]["ids"]
      @members = User.find(user_ids)
    end
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      # session情報を削除
      session["members_list"] = nil
      redirect_to root_path
    else
      # session情報からユーザーを検索し、その結果をrender先へ持ち越す
      user_ids = session["members_list"]["users"]["ids"]
      @members = User.find(user_ids)
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @group = Group.find(params[:id])
    @users = @group.users
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    redirect_to root_path
  end

  private

  # メンバーリストに追加する時のストロングパラメータ
  def add_members_params
    params.require(:group).permit(user_ids:[])
  end

  # グループ作成時のストロングパラメータ
  def group_params 
    params.require(:group).permit(:name, user_ids:[])
  end
  
end
