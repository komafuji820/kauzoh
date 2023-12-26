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
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:memo, :category_id, :priority_id).merge(group_id: params[:group_id])
  end
end
