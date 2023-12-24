class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def items_params
    params.require(:item).permit(:memo, :category_id).merge(group_id: params[:group_id])
  end

end
