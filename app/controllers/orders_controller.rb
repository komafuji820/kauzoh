class OrdersController < ApplicationController
  before_action :find_group, only: [:index, :new, :destroy_checked]
  before_action :find_order, only: [:edit, :update]
  before_action :limit_access, only: [:index, :new]

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
    @group = @order.group
    unless @order.group.users.include?(current_user)
      redirect_to root_path
    end
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
    if order.group.users.include?(current_user)
      order.destroy
    end
    redirect_to group_orders_path(order.group.id)
  end

  def destroy_checked
    if @group.users.include?(current_user)
      Order.destroy_orders(params[:order_ids])
      Purchase.destroy_purchases(params[:purchase_ids])
    end
    redirect_to group_orders_path(params[:group_id])
  end

  private

  def order_create_params
    params.require(:order).permit(:priority_id, :memo, :item_id).merge(group_id: params[:group_id])
  end

  def order_update_params
    params.require(:order).permit(:priority_id, :memo).merge(group_id: @order.group.id)
  end

  def find_group
    @group = Group.find(params[:group_id])
  end

  def find_order
    @order = Order.find(params[:id])
  end

  def limit_access
    unless @group.users.include?(current_user)
      redirect_to root_path
    end
  end

end