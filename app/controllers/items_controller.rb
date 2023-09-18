class ItemsController < ApplicationController
  before_action :move_to_sign_in, only: [:new]
  before_action :set_item, only: %i[show edit update]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit
    return if user_signed_in? && current_user.id == @item.user_id

    redirect_to action: :index
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def move_to_sign_in
    return if user_signed_in?

    redirect_to new_user_session_path
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :condition_id, :derivery_cost_id,
                                 :prefecture_id, :sending_date_id, :price).merge(user_id: current_user.id)
  end
end
