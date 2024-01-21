class PurchasesController < ApplicationController
  before_action :find_purchase, only: [:edit, :update]
  before_action :find_group, only: [:new, :create]

  def new
    unless @group.users.include?(current_user)
      redirect_to root_path
    end
    @purchase = Purchase.new
  end

  def create
    @purchase = @group.purchases.new(purchase_create_params)
    if @purchase.save
      redirect_to group_orders_path(@purchase.group.id)
    else
      @group = Group.find(params[:group_id])
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @group = @purchase.group
    unless @purchase.group.users.include?(current_user)
      redirect_to root_path
    end
  end

  def update
    if @purchase.update(purchase_update_params)
      redirect_to group_orders_path(@purchase.group.id)
    else
      @group = @purchase.group
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    purchase = Purchase.find(params[:id])
    if purchase.group.users.include?(current_user)
      purchase.destroy
    end
    redirect_to group_orders_path(purchase.group.id)
  end

  private

  def purchase_create_params
    params.require(:purchase).permit(:priority_id, :category_id, :memo, :image).merge(group_id: params[:group_id])
  end

  def purchase_update_params
    params.require(:purchase).permit(:priority_id, :category_id, :memo, :image).merge(group_id: @purchase.group.id)
  end

  def find_purchase
    @purchase = Purchase.find(params[:id])
  end

  def find_group
    @group = Group.find(params[:group_id])
  end

end
