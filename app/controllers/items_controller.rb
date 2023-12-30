class ItemsController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @items = @group.items
  end

  def new
    @group = Group.find(params[:group_id])
    @item = Item.new
  end

  def create
    @item = Item.new(item_create_params)
    if @item.save
      redirect_to group_items_path(@item.group.id)
    else
      @group = Group.find(params[:group_id])
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_update_params)
      redirect_to group_items_path(@item.group.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to group_items_path(item.group.id)
  end

  private

  def item_create_params
    params.require(:item).permit(:image, :memo, :category_id).merge(group_id: params[:group_id])
  end

  def item_update_params
    params.require(:item).permit(:image, :memo, :category_id).merge(group_id: @item.group.id)
  end

end
