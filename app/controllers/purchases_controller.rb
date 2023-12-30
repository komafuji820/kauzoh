class PurchasesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @purchases = @group.purchases
  end

  def new
    @group = Group.find(params[:group_id])
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
    @purchase = Purchase.find(params[:id])
  end

  def update
    @purchase = Purchase.find(params[:id])
    if @purchase.update(purchase_update_params)
      redirect_to group_purchases_path(@purchase.group.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def purchase_create_params
    params.require(:purchase).permit(:priority_id, :category_id, :memo, :image).merge(group_id: params[:group_id])
  end

  def purchase_update_params
    params.require(:purchase).permit(:priority_id, :category_id, :memo, :image).merge(group_id: @purchase.group.id)
  end

end
