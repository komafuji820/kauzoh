class ItemsController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @items = @group.items
  end

  def new
    @item = Item.new
    @group = Group.find(params[:group_id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to group_items_path(@item.group.id)
    else
      @group = Group.find(params[:group_id])
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to group_items_path(item.group.id)
    else
      @item = Item.find(params[:id])
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to group_items_path(item.group.id)
  end

  private

  def item_params
    params.require(:item).permit(:image, :memo, :category_id).merge(group_id: params[:group_id])
  end

end
