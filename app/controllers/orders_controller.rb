class OrdersController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @orders = @group.orders
  end

  def new
    @group = Group.find(params[:group_id])
    @item = Item.find(params[:id])
    @order = Order.new
  end

  def create
    @order = Order.new(order_create_params)
    if @order.save
      redirect_to group_orders_path(@order.group.id)
    else
      @group = Group.find(params[:group_id])
      @item = Item.find(params[:id])
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_update_params)
      redirect_to group_orders_path(@order.group.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
    redirect_to group_orders_path(order.group.id)
  end

  private

  def order_create_params
    params.require(:order).permit(:priority_id, :category_id, :memo, :item_id).merge(group_id: params[:group_id])
  end

  def order_update_params
    params.require(:order).permit(:priority_id, :category_id, :memo, :item_id).merge(group_id: @order.group_id)
  end
end