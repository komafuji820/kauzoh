class OrdersController < ApplicationController
  before_action :find_group, only: [:index, :new]
  before_action :find_order, only: [:edit, :update]

  def index
    @orders = @group.orders
    @purchases = @group.purchases
  end

  def new
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
  end

  def update
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
    params.require(:order).permit(:priority_id, :category_id, :memo).merge(group_id: @order.group.id)
  end

  def find_group
    @group = Group.find(params[:group_id])
  end

  def find_order
    @order = Order.find(params[:id])
  end
end