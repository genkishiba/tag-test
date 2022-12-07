class ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
  end

  def create
    if Shop.create(find_params)
      redirect_to shops_path, notice:"新增成功"
    else
      render :new
    end
  end

  def show
    @shop = Shop.find_by!(id: params[:id])
  end

  def edit
    @shop = Shop.find_by!(id: params[:id])
  end

  def update
    @shop = Shop.find_by!(id: params[:id])
    if @shop.update(find_params)
      redirect_to shops_path, notice:"更改成功"
    else
      render :edit
    end
  end

  def destroy
    @shop = Shop.find_by!(id: params[:id])
    @shop.destroy
    redirect_to shops_path, notice:"刪除成功"
  end

  private
  def find_params
    params.require(:shop).permit(:title, :tel, :address, :tag_list)
  end
end
