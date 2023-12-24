class ItemsController < ApplicationController
  def index
    group = Group.find(params[:group_id])
    @items = group.items
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:memo, :category_id).merge(group_id: params[:group_id])
  end

end
