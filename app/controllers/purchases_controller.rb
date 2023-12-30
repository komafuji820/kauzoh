class PurchasesController < ApplicationController
  before_action :find_group, only: [:index, :new]
  before_action :find_purchase, only: [:edit, :update]

  def index
    @purchases = @group.purchases
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_create_params)
    if @purchase.save
      redirect_to group_purchases_path(@purchase.group.id)
    else
      @group = Group.find(params[:group_id])
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @purchase.update(purchase_update_params)
      redirect_to group_purchases_path(@purchase.group.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    purchase = Purchase.find(params[:id])
    purchase.destroy
    redirect_to group_purchases_path(purchase.group.id)
  end

  private

  def purchase_create_params
    params.require(:purchase).permit(:priority_id, :category_id, :memo, :image).merge(group_id: params[:group_id])
  end

  def purchase_update_params
    params.require(:purchase).permit(:priority_id, :category_id, :memo, :image).merge(group_id: @purchase.group.id)
  end

  def find_group
    @group = Group.find(params[:group_id])
  end

  def find_purchase
    @purchase = Purchase.find(params[:id])
  end

end
