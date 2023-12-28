class OrdersController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @orders = @group.orders
  end

  def new
    @group = Group.find(params[:group_id])
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to group_orders_path(@order.group.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    if order.update(order_params)
      redirect_to group_orders_path(order.group.id)
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

  def order_params
    params.require(:order).permit(:memo, :category_id, :priority_id).merge(group_id: params[:group_id])
  end
end
